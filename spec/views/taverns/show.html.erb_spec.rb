require 'rails_helper'

RSpec.describe "taverns/show", type: :view do
  before(:each) do
    assign(:tavern, Tavern.create!(
      name: "Name",
      kind: 2,
      description: "Description",
      roles: "Roles"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Roles/)
  end
end
