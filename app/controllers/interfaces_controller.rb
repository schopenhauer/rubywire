require 'rqrcode'

class InterfacesController < ApplicationController
  include QrHelper

  before_action :set_interface, only: %i[
    show edit update destroy generate_qrcode show_config_file download_config_file
  ]

  # GET /interfaces or /interfaces.json
  def index
    @interfaces = Interface.all.includes(:key).order('keys.name').page params[:page]
  end

  # GET /interfaces/1 or /interfaces/1.json
  def show
  end

  # GET /interfaces/new
  def new
    @interface = Interface.new
  end

  # GET /interfaces/1/edit
  def edit
  end

  def generate_qrcode
    send_data create_qr_as_png(@interface.config_file), type: 'image/png', disposition: 'inline'
  end

  def show_config_file
    render plain: @interface.config_file
  end

  def download_config_file
    send_data @interface.config_file, filename: "#{@interface.name}.conf"
  end

  # POST /interfaces or /interfaces.json
  def create
    @interface = Interface.new(interface_params)

    respond_to do |format|
      if @interface.save
        format.html { redirect_to interfaces_url, notice: "Interface was successfully created." }
        format.json { render :show, status: :created, location: @interface }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interface.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interfaces/1 or /interfaces/1.json
  def update
    respond_to do |format|
      if @interface.update(interface_params)
        format.html { redirect_to interfaces_url, notice: "Interface was successfully updated." }
        format.json { render :show, status: :ok, location: @interface }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interface.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interfaces/1 or /interfaces/1.json
  def destroy
    @interface.destroy
    respond_to do |format|
      format.html { redirect_to interfaces_url, notice: "Interface was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interface
      @interface = Interface.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interface_params
      params.require(:interface).permit(:name, :address, :psk_id, :dns, :key_id, :postup, :postdown, :port)
    end

end
