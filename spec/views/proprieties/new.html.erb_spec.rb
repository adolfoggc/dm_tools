require 'rails_helper'

RSpec.describe "proprieties/new", type: :view do
  before(:each) do
    assign(:propriety, Propriety.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new propriety form" do
    render

    assert_select "form[action=?][method=?]", proprieties_path, "post" do

      assert_select "input[name=?]", "propriety[name]"

      assert_select "input[name=?]", "propriety[description]"
    end
  end
end
