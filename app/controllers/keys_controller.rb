class KeysController < ApplicationController
  before_action :set_key, only: %i[ show edit update destroy ]
  include WgHelper

  # GET /keys or /keys.json
  def index
    @keys = Key.all.order('name').page params[:page]
  end

  # GET /keys/1 or /keys/1.json
  def show
  end

  # GET /keys/new
  def new
    @key = Key.new
    if wg?
      @key.privatekey = wg_genkey()
      @key.publickey = wg_pubkey(@key.privatekey)
    end
  end

  # GET /keys/1/edit
  def edit
  end

  # POST /keys or /keys.json
  def create
    @key = Key.new(key_params)

    respond_to do |format|
      if @key.save
        format.html { redirect_to keys_url, notice: "Key was successfully created." }
        format.json { render :show, status: :created, location: @key }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keys/1 or /keys/1.json
  def update
    respond_to do |format|
      if @key.update(key_params)
        format.html { redirect_to keys_url, notice: "Key was successfully updated." }
        format.json { render :show, status: :ok, location: @key }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keys/1 or /keys/1.json
  def destroy
    @key.destroy
    respond_to do |format|
      format.html { redirect_to keys_url, notice: "Key was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key
      @key = Key.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def key_params
      params.require(:key).permit(:name, :publickey, :privatekey, :description)
    end

end
