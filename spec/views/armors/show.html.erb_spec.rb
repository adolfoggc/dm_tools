require 'rails_helper'

RSpec.describe "armors/show", type: :view do
  before(:each) do
    assign(:armor, Armor.create!(
      name: "Name",
      kind: "Kind",
      ac: "Ac",
      weight: "Weight",
      price: "Price",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Kind/)
    expect(rendered).to match(/Ac/)
    expect(rendered).to match(/Weight/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Description/)
  end
end
