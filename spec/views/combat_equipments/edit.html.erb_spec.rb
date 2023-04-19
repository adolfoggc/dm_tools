require 'rails_helper'

RSpec.describe "combat_equipments/edit", type: :view do
  let(:combat_equipment) {
    CombatEquipment.create!(
      name: "MyString",
      kind: "MyString",
      ac: "MyString",
      dmg: "MyString",
      weight: "MyString",
      price: "MyString"
    )
  }

  before(:each) do
    assign(:combat_equipment, combat_equipment)
  end

  it "renders the edit combat_equipment form" do
    render

    assert_select "form[action=?][method=?]", combat_equipment_path(combat_equipment), "post" do

      assert_select "input[name=?]", "combat_equipment[name]"

      assert_select "input[name=?]", "combat_equipment[kind]"

      assert_select "input[name=?]", "combat_equipment[ac]"

      assert_select "input[name=?]", "combat_equipment[dmg]"

      assert_select "input[name=?]", "combat_equipment[weight]"

      assert_select "input[name=?]", "combat_equipment[price]"
    end
  end
end
