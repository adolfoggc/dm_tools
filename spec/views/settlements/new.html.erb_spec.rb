require 'rails_helper'

RSpec.describe "settlements/new", type: :view do
  before(:each) do
    assign(:settlement, Settlement.new(
      name: "MyString",
      size: "MyString",
      description: "MyString"
    ))
  end

  it "renders new settlement form" do
    render

    assert_select "form[action=?][method=?]", settlements_path, "post" do

      assert_select "input[name=?]", "settlement[name]"

      assert_select "input[name=?]", "settlement[size]"

      assert_select "input[name=?]", "settlement[description]"
    end
  end
end
