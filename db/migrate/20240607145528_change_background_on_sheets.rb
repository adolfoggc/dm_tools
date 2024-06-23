class ChangeBackgroundOnSheets < ActiveRecord::Migration[7.0]
  def change
    change_column :sheets, :background, :integer, using: 'background::integer'
  end
end
