require 'rails_helper'

RSpec.describe "weapons/show", type: :view do
  before(:each) do
    assign(:weapon, Weapon.create!(
      name: "Name",
      kind: 2,
      melee_or_ranged: 3,
      one_handed: false,
      dmg: "Dmg",
      cost: 4,
      weight: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Dmg/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
