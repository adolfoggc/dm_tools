class AddInitialClassToSheet < ActiveRecord::Migration[7.0]
  def change
    add_column :sheets, :initial_class, :integer
  end
end
