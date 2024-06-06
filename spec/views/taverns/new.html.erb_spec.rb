require 'rails_helper'

RSpec.describe "taverns/new", type: :view do
  before(:each) do
    assign(:tavern, Tavern.new(
      name: "MyString",
      kind: 1,
      description: "MyString",
      roles: "MyString"
    ))
  end

  it "renders new tavern form" do
    render

    assert_select "form[action=?][method=?]", taverns_path, "post" do

      assert_select "input[name=?]", "tavern[name]"

      assert_select "input[name=?]", "tavern[kind]"

      assert_select "input[name=?]", "tavern[description]"

      assert_select "input[name=?]", "tavern[roles]"
    end
  end
end
