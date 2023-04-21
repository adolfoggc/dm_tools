require 'rails_helper'

RSpec.describe "weapons/edit", type: :view do
  let(:weapon) {
    Weapon.create!(
      name: "MyString",
      kind: 1,
      melee_or_ranged: 1,
      one_handed: false,
      dmg: "MyString",
      cost: 1,
      weight: 1
    )
  }

  before(:each) do
    assign(:weapon, weapon)
  end

  it "renders the edit weapon form" do
    render

    assert_select "form[action=?][method=?]", weapon_path(weapon), "post" do

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
