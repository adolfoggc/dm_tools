class CreateWeaponProprieties < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_proprieties do |t|
      t.references :weapon, null: false, foreign_key: true
      t.references :propriety, null: false, foreign_key: true

      t.timestamps
    end
  end
end
