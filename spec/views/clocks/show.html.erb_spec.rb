require 'rails_helper'

RSpec.describe "clocks/show", type: :view do
  before(:each) do
    assign(:clock, Clock.create!(
      name: "Name",
      size: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
