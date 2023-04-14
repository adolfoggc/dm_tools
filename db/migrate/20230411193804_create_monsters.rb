class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :challange_rating
      t.integer :ac
      t.string :hp
      t.integer :size
      t.string :speed

      t.timestamps
    end

    add_index :monsters, :name, unique: true
  end
end
