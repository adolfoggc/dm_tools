require 'rails_helper'

RSpec.describe "combat_equipments/show", type: :view do
  before(:each) do
    assign(:combat_equipment, CombatEquipment.create!(
      name: "Name",
      kind: "Kind",
      ac: "Ac",
      dmg: "Dmg",
      weight: "Weight",
      price: "Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Kind/)
    expect(rendered).to match(/Ac/)
    expect(rendered).to match(/Dmg/)
    expect(rendered).to match(/Weight/)
    expect(rendered).to match(/Price/)
  end
end
