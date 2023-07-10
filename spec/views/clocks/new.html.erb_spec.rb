require 'rails_helper'

RSpec.describe "clocks/new", type: :view do
  before(:each) do
    assign(:clock, Clock.new(
      name: "MyString",
      size: 1
    ))
  end

  it "renders new clock form" do
    render

    assert_select "form[action=?][method=?]", clocks_path, "post" do

      assert_select "input[name=?]", "clock[name]"

      assert_select "input[name=?]", "clock[size]"
    end
  end
end
