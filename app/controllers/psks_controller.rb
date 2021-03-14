class PsksController < ApplicationController
  before_action :set_psk, only: %i[ show edit update destroy ]

  # GET /psks or /psks.json
  def index
    @psks = Psk.all.order('name').page params[:page]
  end

  # GET /psks/1 or /psks/1.json
  def show
  end

  # GET /psks/new
  def new
    @psk = Psk.new
    @psk.psk = wg_genpsk() if wg?
  end

  # GET /psks/1/edit
  def edit
  end

  # POST /psks or /psks.json
  def create
    @psk = Psk.new(psk_params)

    respond_to do |format|
      if @psk.save
        format.html { redirect_to psks_url, notice: "Psk was successfully created." }
        format.json { render :show, status: :created, location: @psk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @psk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psks/1 or /psks/1.json
  def update
    respond_to do |format|
      if @psk.update(psk_params)
        format.html { redirect_to psks_url, notice: "Psk was successfully updated." }
        format.json { render :show, status: :ok, location: @psk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @psk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psks/1 or /psks/1.json
  def destroy
    @psk.destroy
    respond_to do |format|
      format.html { redirect_to psks_url, notice: "Psk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_psk
      @psk = Psk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def psk_params
      params.require(:psk).permit(:psk, :name, :description)
    end
end
