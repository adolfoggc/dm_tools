require 'rails_helper'

RSpec.describe "proprieties/show", type: :view do
  before(:each) do
    assign(:propriety, Propriety.create!(
      name: "Name",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
