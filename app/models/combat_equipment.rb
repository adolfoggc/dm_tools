class CombatEquipment < ApplicationRecord
  enum kind: {
    light_armor: 0,
    medium_armor: 1,
    heavy_armor: 2,
    shield: 3,
    helmet: 4,
    simple_melee_weapon: 5,
    simple_ranged_weapon: 6,
    martial_melee_weapon: 7,
    martial_ranged_weapon: 8,
    other: 9
  }

  def item_weight
    if I18n.locale.to_s == 'en'
      weight + 'lb'.pluralize(weight)
    else
      converted_weight = weight/2
      converted_weight + 'kg'.pluralize(converted_weight)
    end
  end
end
