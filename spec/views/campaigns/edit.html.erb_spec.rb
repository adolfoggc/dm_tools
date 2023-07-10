require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  let(:campaign) {
    Campaign.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:campaign, campaign)
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(campaign), "post" do

      assert_select "input[name=?]", "campaign[name]"
    end
  end
end
