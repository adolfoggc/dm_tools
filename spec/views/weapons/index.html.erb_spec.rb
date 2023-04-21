require 'rails_helper'

RSpec.describe "weapons/index", type: :view do
  before(:each) do
    assign(:weapons, [
      Weapon.create!(
        name: "Name",
        kind: 2,
        melee_or_ranged: 3,
        one_handed: false,
        dmg: "Dmg",
        cost: 4,
        weight: 5
      ),
      Weapon.create!(
        name: "Name",
        kind: 2,
        melee_or_ranged: 3,
        one_handed: false,
        dmg: "Dmg",
        cost: 4,
        weight: 5
      )
    ])
  end

  it "renders a list of weapons" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dmg".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
  end
end
