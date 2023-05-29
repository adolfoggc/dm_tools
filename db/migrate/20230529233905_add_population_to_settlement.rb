class AddPopulationToSettlement < ActiveRecord::Migration[7.0]
  def change
    add_column :settlements, :population, :integer
    add_column :settlements, :kind, :integer
  end
end
