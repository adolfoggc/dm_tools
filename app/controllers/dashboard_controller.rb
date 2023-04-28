class DashboardController < ApplicationController
  def home
  end

  def encounter_calculator
    @monsters = {}
    Monster.all.order(:name).select('name', 'challange_rating').each do |m|
      if I18n.exists?(m.name, :pt_BR)
        name = t(m.name)
      else
        name = m.name.humanize.capitalize
      end
      @monsters[name] = m.challange_rating
    end
    @monsters = @monsters.sort.to_h
  end
end
