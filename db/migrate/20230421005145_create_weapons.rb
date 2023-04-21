class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :kind
      t.integer :melee_or_ranged
      t.boolean :one_handed, default: true
      t.string :dmg
      t.integer :price
      t.integer :weight

      t.timestamps
    end

    add_index :weapons, :name, unique: true
  end
end
