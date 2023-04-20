require 'rails_helper'

RSpec.describe "armors/edit", type: :view do
  let(:armor) {
    Armor.create!(
      name: "MyString",
      kind: "MyString",
      ac: "MyString",
      weight: "MyString",
      price: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:armor, armor)
  end

  it "renders the edit armor form" do
    render

    assert_select "form[action=?][method=?]", armor_path(armor), "post" do

      assert_select "input[name=?]", "armor[name]"

      assert_select "input[name=?]", "armor[kind]"

      assert_select "input[name=?]", "armor[ac]"

      assert_select "input[name=?]", "armor[weight]"

      assert_select "input[name=?]", "armor[price]"

      assert_select "input[name=?]", "armor[description]"
    end
  end
end
