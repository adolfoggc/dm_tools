require 'rails_helper'

RSpec.describe "settlements/edit", type: :view do
  let(:settlement) {
    Settlement.create!(
      name: "MyString",
      size: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:settlement, settlement)
  end

  it "renders the edit settlement form" do
    render

    assert_select "form[action=?][method=?]", settlement_path(settlement), "post" do

      assert_select "input[name=?]", "settlement[name]"

      assert_select "input[name=?]", "settlement[size]"

      assert_select "input[name=?]", "settlement[description]"
    end
  end
end
