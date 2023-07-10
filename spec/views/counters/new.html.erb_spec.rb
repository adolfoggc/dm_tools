require 'rails_helper'

RSpec.describe "counters/new", type: :view do
  before(:each) do
    assign(:counter, Counter.new(
      clock: nil,
      size: 1,
      description: "MyString"
    ))
  end

  it "renders new counter form" do
    render

    assert_select "form[action=?][method=?]", counters_path, "post" do

      assert_select "input[name=?]", "counter[clock_id]"

      assert_select "input[name=?]", "counter[size]"

      assert_select "input[name=?]", "counter[description]"
    end
  end
end
