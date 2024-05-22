json.extract! sheet, :id, :name, :player_name, :alignment, :background, :race, :experience, :strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma, :hp, :temp_hp, :created_at, :updated_at
json.url sheet_url(sheet, format: :json)
