class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :kind
      t.string :dmg
      t.integer :price
      t.string :weight
      t.string :description

      t.timestamps
    end

    add_index :weapons, :name, unique: true
  end
end
