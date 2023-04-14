require 'rails_helper'

RSpec.describe "monsters/show", type: :view do
  before(:each) do
    assign(:monster, Monster.create!(
      name: "Name",
      challange_rating: "Challange Rating",
      ac: 2,
      hp: "Hp",
      size: 3,
      speed: "Speed"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Challange Rating/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Hp/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Speed/)
  end
end
