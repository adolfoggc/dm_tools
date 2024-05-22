class CreateSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :sheets do |t|
      t.string :name
      t.string :player_name
      t.integer :alignment
      t.string :background
      t.integer :race
      t.integer :experience
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :wisdom
      t.integer :intelligence
      t.integer :charisma
      t.integer :hp
      t.integer :temp_hp

      t.timestamps
    end
  end
end
