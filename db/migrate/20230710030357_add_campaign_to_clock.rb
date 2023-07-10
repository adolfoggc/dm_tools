class AddCampaignToClock < ActiveRecord::Migration[7.0]
  def change
    add_reference :clocks, :campaign, null: false, foreign_key: true
  end
end
