require 'net/sftp'

class HostsController < ApplicationController
  before_action :set_host, only: %i[ show edit update destroy upload ]

  # GET /hosts or /hosts.json
  def index
    @hosts = Host.all.order('name').page params[:page]
  end

  # GET /hosts/1 or /hosts/1.json
  def show
  end

  def upload
    unless params[:host].nil?
      @host.errors.add(:id, 'not selected') if params[:host][:id].nil?
      @host.errors.add(:interface_id, 'not selected') if params[:host][:interface_id] == ''
    end
    if params[:host].nil? || @host.errors.any?
      @hosts = Host.all
      @interfaces = Interface.all
      render :upload
    else
      interface = Interface.find(params[:host][:interface_id])
      filename = File.join(@host.path, "#{interface.name}.conf")
      config_file = interface.config_file
      overwrite = params[:host][:overwrite] == '1' ? true : false
      sftp_upload_file(filename, config_file, @host.hostname, @host.username, overwrite)
      redirect_to hosts_url, {
        notice: "Uploading configuration file (#{interface.name}.conf) to #{@host.name}..."
      }
    end
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
  end

  # POST /hosts or /hosts.json
  def create
    @host = Host.new(host_params)
    respond_to do |format|
      if @host.save
        format.html { redirect_to hosts_url, notice: "Host was successfully created." }
        format.json { render :show, status: :created, location: @host }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hosts/1 or /hosts/1.json
  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to hosts_url, notice: "Host was successfully updated." }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1 or /hosts/1.json
  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: "Host was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def host_params
      params.require(:host).permit(:name, :username, :hostname, :port, :path, :key)
    end

    # Upload file using SFTP.
    def sftp_upload_file(filename, data, hostname, username, overwrite = false)
      Net::SFTP.start(hostname, username) do |sftp|
         sftp.stat(filename) do |response|
           if !response.ok? || overwrite
             sftp.upload! StringIO.new(data), filename
           end
         end
      end
    end

end
