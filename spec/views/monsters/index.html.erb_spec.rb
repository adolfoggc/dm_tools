require 'rails_helper'

RSpec.describe "monsters/index", type: :view do
  before(:each) do
    assign(:monsters, [
      Monster.create!(
        name: "Name",
        challange_rating: "Challange Rating",
        ac: 2,
        hp: "Hp",
        size: 3,
        speed: "Speed"
      ),
      Monster.create!(
        name: "Name",
        challange_rating: "Challange Rating",
        ac: 2,
        hp: "Hp",
        size: 3,
        speed: "Speed"
      )
    ])
  end

  it "renders a list of monsters" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Challange Rating".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Hp".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Speed".to_s), count: 2
  end
end
