require 'rails_helper'

RSpec.describe "clocks/index", type: :view do
  before(:each) do
    assign(:clocks, [
      Clock.create!(
        name: "Name",
        size: 2
      ),
      Clock.create!(
        name: "Name",
        size: 2
      )
    ])
  end

  it "renders a list of clocks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
