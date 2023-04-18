class DashboardController < ApplicationController
  def home
  end

  def encounter_calculator
    @monsters = {}
    Monster.all.order(:name).select('name', 'challange_rating').each do |m|
      @monsters[m.name.humanize.capitalize] = m.challange_rating
    end
  end
end
