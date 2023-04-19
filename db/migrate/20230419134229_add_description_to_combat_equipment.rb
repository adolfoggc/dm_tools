class AddDescriptionToCombatEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :combat_equipments, :description, :text
  end
end
