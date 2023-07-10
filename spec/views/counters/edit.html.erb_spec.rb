require 'rails_helper'

RSpec.describe "counters/edit", type: :view do
  let(:counter) {
    Counter.create!(
      clock: nil,
      size: 1,
      description: "MyString"
    )
  }

  before(:each) do
    assign(:counter, counter)
  end

  it "renders the edit counter form" do
    render

    assert_select "form[action=?][method=?]", counter_path(counter), "post" do

      assert_select "input[name=?]", "counter[clock_id]"

      assert_select "input[name=?]", "counter[size]"

      assert_select "input[name=?]", "counter[description]"
    end
  end
end
