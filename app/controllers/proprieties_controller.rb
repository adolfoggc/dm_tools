class ProprietiesController < ApplicationController
  before_action :set_propriety, only: %i[ show edit update destroy ]

  # GET /proprieties or /proprieties.json
  def index
    @proprieties = Propriety.all
  end

  # GET /proprieties/1 or /proprieties/1.json
  def show
  end

  # GET /proprieties/new
  def new
    @propriety = Propriety.new
  end

  # GET /proprieties/1/edit
  def edit
  end

  # POST /proprieties or /proprieties.json
  def create
    @propriety = Propriety.new(propriety_params)

    respond_to do |format|
      if @propriety.save
        format.html { redirect_to propriety_url(@propriety), notice: "Propriety was successfully created." }
        format.json { render :show, status: :created, location: @propriety }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @propriety.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proprieties/1 or /proprieties/1.json
  def update
    respond_to do |format|
      if @propriety.update(propriety_params)
        format.html { redirect_to propriety_url(@propriety), notice: "Propriety was successfully updated." }
        format.json { render :show, status: :ok, location: @propriety }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @propriety.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proprieties/1 or /proprieties/1.json
  def destroy
    @propriety.destroy

    respond_to do |format|
      format.html { redirect_to proprieties_url, notice: "Propriety was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_propriety
      @propriety = Propriety.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def propriety_params
      params.require(:propriety).permit(:name, :description)
    end
end
