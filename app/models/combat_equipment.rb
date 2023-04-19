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

end
