class Armor < ApplicationRecord
  enum kind: {
    light_armor: 0,
    medium_armor: 1,
    heavy_armor: 2,
    shield: 3,
    helmet: 4
    #simple_melee_weapon: 5,
    #simple_ranged_weapon: 6,
    #martial_melee_weapon: 7,
    #martial_ranged_weapon: 8,
    #other: 9
  }

  def item_weight
    if I18n.locale.to_s == 'en'
      weight.to_s + ' lb'.pluralize(weight)
    else
      converted_weight = (weight/2).to_i
      converted_weight.to_s + ' kg'.pluralize(converted_weight)
    end
  end

  def donning_armor
    case kind
    when 'light_armor'
      '1 ' + I18n.translate('minute')
    when 'medium_armor'
      '5 ' + I18n.translate('minute').pluralize
    when 'heavy_armor'
      '10 ' + I18n.translate('minute').pluralize
    else
      '1 ' + I18n.translate('action')
    end 
  end

  def doffing_armor
    case kind
    when 'light_armor'
      '1 ' + I18n.translate('minute')
    when 'medium_armor'
      '1 ' + I18n.translate('minute')
    when 'heavy_armor'
      '5 ' + I18n.translate('minute').pluralize
    else
      '1 ' + I18n.translate('action')
    end
  end
end

