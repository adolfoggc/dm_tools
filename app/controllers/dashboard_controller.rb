class DashboardController < ApplicationController
  def home
  end

  def encounter_calculator
    @monsters = Monster.all.select('name', 'challange_rating')
  end
end
