require 'rails_helper'

RSpec.describe "sheets/show", type: :view do
  before(:each) do
    assign(:sheet, Sheet.create!(
      name: "Name",
      player_name: "Player Name",
      alignment: 2,
      background: "Background",
      race: 3,
      experience: 4,
      strength: 5,
      dexterity: 6,
      constitution: 7,
      wisdom: 8,
      intelligence: 9,
      charisma: 10,
      hp: 11,
      temp_hp: 12
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Player Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Background/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
  end
end
