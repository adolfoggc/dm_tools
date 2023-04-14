class AddAbilitiesToMonsters < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :abilities, :string
  end
end
