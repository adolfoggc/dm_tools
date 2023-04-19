class CombatEquipmentsController < ApplicationController
  before_action :set_combat_equipment, only: %i[ show edit update destroy ]

  # GET /combat_equipments or /combat_equipments.json
  def index
    @combat_equipments = CombatEquipment.all
  end

  # GET /combat_equipments/1 or /combat_equipments/1.json
  def show
  end

  # GET /combat_equipments/new
  def new
    @combat_equipment = CombatEquipment.new
  end

  # GET /combat_equipments/1/edit
  def edit
  end

  # POST /combat_equipments or /combat_equipments.json
  def create
    @combat_equipment = CombatEquipment.new(combat_equipment_params)

    respond_to do |format|
      if @combat_equipment.save
        format.html { redirect_to combat_equipment_url(@combat_equipment), notice: "Combat equipment was successfully created." }
        format.json { render :show, status: :created, location: @combat_equipment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @combat_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combat_equipments/1 or /combat_equipments/1.json
  def update
    respond_to do |format|
      if @combat_equipment.update(combat_equipment_params)
        format.html { redirect_to combat_equipment_url(@combat_equipment), notice: "Combat equipment was successfully updated." }
        format.json { render :show, status: :ok, location: @combat_equipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @combat_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combat_equipments/1 or /combat_equipments/1.json
  def destroy
    @combat_equipment.destroy

    respond_to do |format|
      format.html { redirect_to combat_equipments_url, notice: "Combat equipment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combat_equipment
      @combat_equipment = CombatEquipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def combat_equipment_params
      params.require(:combat_equipment).permit(:name, :kind, :ac, :dmg, :weight, :price)
    end
end
