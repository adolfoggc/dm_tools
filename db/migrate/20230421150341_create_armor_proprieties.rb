class CreateArmorProprieties < ActiveRecord::Migration[7.0]
  def change
    create_table :armor_proprieties do |t|
      t.references :armor, null: false, foreign_key: true
      t.references :propriety, null: false, foreign_key: true

      t.timestamps
    end
  end
end
