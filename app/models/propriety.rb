class Propriety < ApplicationRecord
  has_many :armor_proprieties
  has_many :armors, through: :armor_proprieties
  has_many :weapon_proprieties
  has_many :weapons, through: :weapon_proprieties
end
