require 'rails_helper'

RSpec.describe "armors/index", type: :view do
  before(:each) do
    assign(:armors, [
      Armor.create!(
        name: "Name",
        kind: "Kind",
        ac: "Ac",
        weight: "Weight",
        price: "Price",
        description: "Description"
      ),
      Armor.create!(
        name: "Name",
        kind: "Kind",
        ac: "Ac",
        weight: "Weight",
        price: "Price",
        description: "Description"
      )
    ])
  end

  it "renders a list of armors" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Kind".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ac".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Weight".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Price".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
