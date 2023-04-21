require 'rails_helper'

RSpec.describe "proprieties/edit", type: :view do
  let(:propriety) {
    Propriety.create!(
      name: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:propriety, propriety)
  end

  it "renders the edit propriety form" do
    render

    assert_select "form[action=?][method=?]", propriety_path(propriety), "post" do

      assert_select "input[name=?]", "propriety[name]"

      assert_select "input[name=?]", "propriety[description]"
    end
  end
end
