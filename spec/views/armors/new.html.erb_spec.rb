require 'rails_helper'

RSpec.describe "armors/new", type: :view do
  before(:each) do
    assign(:armor, Armor.new(
      name: "MyString",
      kind: "MyString",
      ac: "MyString",
      weight: "MyString",
      price: "MyString",
      description: "MyString"
    ))
  end

  it "renders new armor form" do
    render

    assert_select "form[action=?][method=?]", armors_path, "post" do

      assert_select "input[name=?]", "armor[name]"

      assert_select "input[name=?]", "armor[kind]"

      assert_select "input[name=?]", "armor[ac]"

      assert_select "input[name=?]", "armor[weight]"

      assert_select "input[name=?]", "armor[price]"

      assert_select "input[name=?]", "armor[description]"
    end
  end
end
