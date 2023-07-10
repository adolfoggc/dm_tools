require 'rails_helper'

RSpec.describe "clocks/edit", type: :view do
  let(:clock) {
    Clock.create!(
      name: "MyString",
      size: 1
    )
  }

  before(:each) do
    assign(:clock, clock)
  end

  it "renders the edit clock form" do
    render

    assert_select "form[action=?][method=?]", clock_path(clock), "post" do

      assert_select "input[name=?]", "clock[name]"

      assert_select "input[name=?]", "clock[size]"
    end
  end
end
