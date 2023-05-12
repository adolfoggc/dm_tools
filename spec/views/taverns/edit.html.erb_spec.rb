require 'rails_helper'

RSpec.describe "taverns/edit", type: :view do
  let(:tavern) {
    Tavern.create!(
      name: "MyString",
      kind: 1,
      description: "MyString",
      roles: "MyString"
    )
  }

  before(:each) do
    assign(:tavern, tavern)
  end

  it "renders the edit tavern form" do
    render

    assert_select "form[action=?][method=?]", tavern_path(tavern), "post" do

      assert_select "input[name=?]", "tavern[name]"

      assert_select "input[name=?]", "tavern[kind]"

      assert_select "input[name=?]", "tavern[description]"

      assert_select "input[name=?]", "tavern[roles]"
    end
  end
end
