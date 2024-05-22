require 'rails_helper'

RSpec.describe "sheets/index", type: :view do
  before(:each) do
    assign(:sheets, [
      Sheet.create!(
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
      ),
      Sheet.create!(
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
      )
    ])
  end

  it "renders a list of sheets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Player Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Background".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(7.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(8.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(9.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(10.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(11.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(12.to_s), count: 2
  end
end
