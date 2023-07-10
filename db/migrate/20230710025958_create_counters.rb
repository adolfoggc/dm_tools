class CreateCounters < ActiveRecord::Migration[7.0]
  def change
    create_table :counters do |t|
      t.references :clock, null: false, foreign_key: true
      t.integer :size
      t.string :description

      t.timestamps
    end
  end
end
