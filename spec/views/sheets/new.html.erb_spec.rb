require 'rails_helper'

RSpec.describe "sheets/new", type: :view do
  before(:each) do
    assign(:sheet, Sheet.new(
      name: "MyString",
      player_name: "MyString",
      alignment: 1,
      background: "MyString",
      race: 1,
      experience: 1,
      strength: 1,
      dexterity: 1,
      constitution: 1,
      wisdom: 1,
      intelligence: 1,
      charisma: 1,
      hp: 1,
      temp_hp: 1
    ))
  end

  it "renders new sheet form" do
    render

    assert_select "form[action=?][method=?]", sheets_path, "post" do

      assert_select "input[name=?]", "sheet[name]"

      assert_select "input[name=?]", "sheet[player_name]"

      assert_select "input[name=?]", "sheet[alignment]"

      assert_select "input[name=?]", "sheet[background]"

      assert_select "input[name=?]", "sheet[race]"

      assert_select "input[name=?]", "sheet[experience]"

      assert_select "input[name=?]", "sheet[strength]"

      assert_select "input[name=?]", "sheet[dexterity]"

      assert_select "input[name=?]", "sheet[constitution]"

      assert_select "input[name=?]", "sheet[wisdom]"

      assert_select "input[name=?]", "sheet[intelligence]"

      assert_select "input[name=?]", "sheet[charisma]"

      assert_select "input[name=?]", "sheet[hp]"

      assert_select "input[name=?]", "sheet[temp_hp]"
    end
  end
end
