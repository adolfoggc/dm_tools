class CreateArmors < ActiveRecord::Migration[7.0]
  def change
    create_table :armors do |t|
      t.string :name
      t.integer :kind
      t.string :ac
      t.integer :weight
      t.integer :price
      t.string :description

      t.timestamps
    end

    add_index :armors, :name, unique: true
  end
end
