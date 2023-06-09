require 'rails_helper'

RSpec.describe "taverns/index", type: :view do
  before(:each) do
    assign(:taverns, [
      Tavern.create!(
        name: "Name",
        kind: 2,
        description: "Description",
        roles: "Roles"
      ),
      Tavern.create!(
        name: "Name",
        kind: 2,
        description: "Description",
        roles: "Roles"
      )
    ])
  end

  it "renders a list of taverns" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Roles".to_s), count: 2
  end
end
