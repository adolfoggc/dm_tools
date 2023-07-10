require 'rails_helper'

RSpec.describe "counters/show", type: :view do
  before(:each) do
    assign(:counter, Counter.create!(
      clock: nil,
      size: 2,
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
  end
end
