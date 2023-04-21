require 'rails_helper'

RSpec.describe "weapons/new", type: :view do
  before(:each) do
    assign(:weapon, Weapon.new(
      name: "MyString",
      kind: 1,
      melee_or_ranged: 1,
      one_handed: false,
      dmg: "MyString",
      cost: 1,
      weight: 1
    ))
  end

  it "renders new weapon form" do
    render

    assert_select "form[action=?][method=?]", weapons_path, "post" do

      assert_select "input[name=?]", "weapon[name]"

      assert_select "input[name=?]", "weapon[kind]"

      assert_select "input[name=?]", "weapon[melee_or_ranged]"

      assert_select "input[name=?]", "weapon[one_handed]"

      assert_select "input[name=?]", "weapon[dmg]"

      assert_select "input[name=?]", "weapon[cost]"

      assert_select "input[name=?]", "weapon[weight]"
    end
  end
end
