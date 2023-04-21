class Weapon < ApplicationRecord
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
      converted_weight = (weight/2).to_i
      converted_weight.to_s + ' kg'.pluralize(converted_weight)
    end
  end
end
