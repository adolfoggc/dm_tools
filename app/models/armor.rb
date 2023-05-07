class Armor < ApplicationRecord
  has_many :armor_proprieties
  has_many :proprieties, through: :armor_proprieties

  enum kind: {
    light_armor: 0,
    medium_armor: 1,
    heavy_armor: 2,
    shield: 3,
    helmet: 4
  }

  def total_ac
    if proprieties.where(name: 'max_dex_bonus:_2').present?
      ac + ' + ' + I18n.translate('dex').upcase + ('(Max: 2)')
    elsif proprieties.where(name: 'no_dex_bonus').present?
      ac
    else
      ac + ' + ' + I18n.translate('dex').upcase
    end
  end

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

