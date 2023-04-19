json.extract! combat_equipment, :id, :name, :kind, :ac, :dmg, :weight, :price, :created_at, :updated_at
json.url combat_equipment_url(combat_equipment, format: :json)
