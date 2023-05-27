require 'rails_helper'

RSpec.describe "settlements/show", type: :view do
  before(:each) do
    assign(:settlement, Settlement.create!(
      name: "Name",
      size: "Size",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Description/)
  end
end
