# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def message(word)
  verbs = ['Adding', 'Creating', 'Craving', 'Harvesting', 'Making',
    'Picking', 'Generating']
  
  adjectives = ['new', 'some', 'fresh', 'delicious', 'hazardous', 'amazing',
    'incredible', 'magic', 'special', 'spatial', 'orthopedic', 'shiny', 'tasty']
  "#{verbs.sample} #{adjectives.sample} #{word}"
end

if Rails.env.production?
  puts 'Sorry, no seeds here..'
else
  unless User.any?
    puts message('credentials')
    User.create(email: 'test@test.com', password: '123123')
  end

  puts 'Prepare for the harvest!'
end

#seed data
monster_data = {
  1 => {name: 'goblin', challange_rating: "1/4",  ac: 11,  hp: '2d6',  size: "small", speed: 30, abilities: '081410100808'}
}

#seed proccess
puts message('monsters')
index = Monster.count
added = 0
while index < monster_data.count do
  index += 1
  Monster.create(monster_data[index])
  added += 1
end

puts 'Added ' + added.to_s + ' monster'.pluralize(added)
puts ''