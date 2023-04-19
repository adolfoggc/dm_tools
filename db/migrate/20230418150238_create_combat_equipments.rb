class CreateCombatEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :combat_equipments do |t|
      t.string :name
      t.string :kind
      t.string :ac
      t.string :dmg
      t.string :weight
      t.string :price

      t.timestamps
    end
  end
end
