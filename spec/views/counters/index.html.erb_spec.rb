require 'rails_helper'

RSpec.describe "counters/index", type: :view do
  before(:each) do
    assign(:counters, [
      Counter.create!(
        clock: nil,
        size: 2,
        description: "Description"
      ),
      Counter.create!(
        clock: nil,
        size: 2,
        description: "Description"
      )
    ])
  end

  it "renders a list of counters" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
