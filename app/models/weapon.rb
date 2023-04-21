class Weapon < ApplicationRecord
  has_many :weapon_proprieties
  has_many :proprieties, through: :weapon_proprieties

  enum kind: {
    simple: 0,
    martial: 1
  }

  enum melee_or_ranged: {
    melee: 0,
    ranged: 1,
    both: 2
  }

  def item_weight
    if I18n.locale.to_s == 'en'
      weight.to_s + ' lb'.pluralize(weight)
    else
      converted_weight = (weight.to_f/2)
      converted_weight.to_s + ' kg'
    end
  end
end
