require 'rails_helper'

RSpec.describe "monsters/edit", type: :view do
  let(:monster) {
    Monster.create!(
      name: "MyString",
      challange_rating: "MyString",
      ac: 1,
      hp: "MyString",
      size: 1,
      speed: "MyString"
    )
  }

  before(:each) do
    assign(:monster, monster)
  end

  it "renders the edit monster form" do
    render

    assert_select "form[action=?][method=?]", monster_path(monster), "post" do

      assert_select "input[name=?]", "monster[name]"

      assert_select "input[name=?]", "monster[challange_rating]"

      assert_select "input[name=?]", "monster[ac]"

      assert_select "input[name=?]", "monster[hp]"

      assert_select "input[name=?]", "monster[size]"

      assert_select "input[name=?]", "monster[speed]"
    end
  end
end
