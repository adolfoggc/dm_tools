json.extract! monster, :id, :name, :challange_rating, :ac, :hp, :size, :speed, :created_at, :updated_at
json.url monster_url(monster, format: :json)
