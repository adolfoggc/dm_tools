require 'rails_helper'

RSpec.describe "settlements/index", type: :view do
  before(:each) do
    assign(:settlements, [
      Settlement.create!(
        name: "Name",
        size: "Size",
        description: "Description"
      ),
      Settlement.create!(
        name: "Name",
        size: "Size",
        description: "Description"
      )
    ])
  end

  it "renders a list of settlements" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Size".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
