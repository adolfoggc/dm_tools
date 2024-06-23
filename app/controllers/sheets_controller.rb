class SheetsController < ApplicationController
  before_action :set_sheet, only: %i[ show edit update destroy ]
  before_action :form_hashes, only: %i[ new create edit update ]

  # GET /sheets or /sheets.json
  def index
    @sheets = Sheet.all
  end

  # GET /sheets/1 or /sheets/1.json
  def show
  end

  # GET /sheets/new
  def new
    @sheet = Sheet.new
  end

  # GET /sheets/1/edit
  def edit
  end

  # POST /sheets or /sheets.json
  def create
    @sheet = Sheet.new(sheet_params)

    respond_to do |format|
      if @sheet.save
        format.html { redirect_to sheet_url(@sheet), notice: "Sheet was successfully created." }
        format.json { render :show, status: :created, location: @sheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheets/1 or /sheets/1.json
  def update
    respond_to do |format|
      if @sheet.update(sheet_params)
        format.html { redirect_to sheet_url(@sheet), notice: "Sheet was successfully updated." }
        format.json { render :show, status: :ok, location: @sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheets/1 or /sheets/1.json
  def destroy
    @sheet.destroy

    respond_to do |format|
      format.html { redirect_to sheets_url, notice: "Sheet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheet
      @sheet = Sheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sheet_params
      params.require(:sheet).permit(:name, :player_name, :alignment, :background, :race, :experience, :strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma, :hp, :temp_hp)
    end

    def form_hashes
      @backgrounds = backgrounds
      @initial_classes = initial_classes
      @races = races
      @alignments = alignments
      @skills_per_background = skills_per_background
    end

    def races
      hash = {}
      Sheet.races.each do |k,v|
        hash[I18n.translate("race.#{k}").titleize] = k
      end

      hash.sort.to_h
    end

    def backgrounds
      hash = {}
      Sheet.backgrounds.each do |k,v|
        hash[I18n.translate("background.#{k}").titleize] = k
      end

      hash.sort.to_h
    end

    def initial_classes
      hash = {}
      Sheet.initial_classes.each do |k,v|
        hash[I18n.translate("class.#{k}").titleize] = k
      end

      hash.sort.to_h
    end

    def alignments
      hash = {}
      Sheet.alignments.each do |k,v|
        hash[I18n.translate("alignment.#{k}").titleize] = k
      end

      hash.sort.to_h
    end

    def skills_per_background
      {
        acolyte: [I18n.translate('skill.insight').titleize, I18n.translate('skill.religion').titleize].sort,
        charlatan: [I18n.translate('skill.deception').titleize, I18n.translate('skill.sleight_of_hand').titleize].sort ,
        criminal: [I18n.translate('skill.deception').titleize, I18n.translate('skill.stealth').titleize].sort ,
        entretainer: [I18n.translate('skill.acrobatics').titleize, I18n.translate('skill.performance').titleize].sort ,
        folk_hero: [I18n.translate('skill.animal_handling').titleize, I18n.translate('skill.survival').titleize].sort ,
        guild_artisan: [I18n.translate('skill.insight').titleize, I18n.translate('skill.persuasion').titleize].sort ,
        hermit: [I18n.translate('skill.medicine').titleize, I18n.translate('skill.religion').titleize].sort ,
        noble: [I18n.translate('skill.history').titleize, I18n.translate('skill.persuasion').titleize].sort ,
        outlander: [I18n.translate('skill.athletics').titleize, I18n.translate('skill.survival').titleize].sort ,
        sage: [I18n.translate('skill.arcana').titleize, I18n.translate('skill.history').titleize].sort ,
        sailor: [I18n.translate('skill.athletics').titleize, I18n.translate('skill.intimidation').titleize].sort ,
        urchin: [I18n.translate('skill.sleight_of_hand').titleize, I18n.translate('skill.stealth').titleize].sort 
      }
    end
end
