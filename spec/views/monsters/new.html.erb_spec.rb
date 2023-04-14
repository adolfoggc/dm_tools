require 'rails_helper'

RSpec.describe "monsters/new", type: :view do
  before(:each) do
    assign(:monster, Monster.new(
      name: "MyString",
      challange_rating: "MyString",
      ac: 1,
      hp: "MyString",
      size: 1,
      speed: "MyString"
    ))
  end

  it "renders new monster form" do
    render

    assert_select "form[action=?][method=?]", monsters_path, "post" do

      assert_select "input[name=?]", "monster[name]"

      assert_select "input[name=?]", "monster[challange_rating]"

      assert_select "input[name=?]", "monster[ac]"

      assert_select "input[name=?]", "monster[hp]"

      assert_select "input[name=?]", "monster[size]"

      assert_select "input[name=?]", "monster[speed]"
    end
  end
end
