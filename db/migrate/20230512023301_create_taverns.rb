class CreateTaverns < ActiveRecord::Migration[7.0]
  def change
    create_table :taverns do |t|
      t.string :name
      t.integer :kind
      t.string :description
      t.string :roles

      t.timestamps
    end
  end
end
