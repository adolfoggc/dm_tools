class Tavern < ApplicationRecord
  before_save :update_description

  enum kind: {
    squalid: 0,
    poor: 1,
    modest: 2,
    confortable: 3,
    whealty: 4,
    aristocratic: 5
  }

  def update_description
    self.description = drinks if self.kind_changed?
  end

  def drinks
    house_drinks = "#{I18n.translate('drinks')}: "
    all_drinks = I18n.translate('drink_menu')
    all_squalid = all_drinks.select { |k,v| k.to_s.include?('squalid') }
    all_poor = all_drinks.select { |k,v| k.to_s.include?('squalid') }
    all_modest = all_drinks.select { |k,v| k.to_s.include?('modest') }
    all_confortable = all_drinks.select { |k,v| k.to_s.include?('confortable') }
    all_whealty = all_drinks.select { |k,v| k.to_s.include?('whealty') }
    all_aristocratic = all_drinks.select { |k,v| k.to_s.include?('aristocratic') }
    case self.kind
    when 'squalid'
      roll = die(2,3)
      house_drinks += create_menu(all_squalid.values, roll)
      roll = die(0,1)
      house_drinks += create_menu(all_poor.values, roll) if roll != 0
    when 'poor'
      roll = die(3,all_squalid.count)
      house_drinks += create_menu(all_squalid.values, roll)
      roll = die(2, all_poor.count/2 + 1)
      house_drinks += create_menu(all_poor.values, roll)
    when 'modest'
    when 'confortable'
    when 'whealty'
    else
    end

    house_drinks
  end

  def create_menu(source, quantity)
    menu_array = []
    while menu_array.count < quantity do
      sample = source.sample
      menu_array << sample unless menu_array.include?(sample)
    end
    menu = ''
    menu_array.each do |m|
      menu += "#{m}, "
    end
    menu
  end
end
