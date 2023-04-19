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

def seed_process(object, data)
  puts message(object.pluralize(2))
  table = eval(object.capitalize)
  index = table.count
  added = 0
  #data = eval(object + '_data')
  while index < data.count do
    index += 1
    table.create(data[index])
    added += 1
  end

  puts 'Added ' + added.to_s + ' '+ object.pluralize(added)
  puts ''
end

#seed data
monster_data = {
  1 => {name: 'goblin', challange_rating: "1/4",  ac: 11,  hp: '2d6',  size: "small", speed: 30, abilities: '081410100808'},
  2 => {name: 'drow', challange_rating: "1/4",  ac: 10,  hp: '3d8',  size: "medium", speed: 30, abilities: '101410111112'},
  3 => {name: 'worg', challange_rating: "1/2",  ac: 12,  hp: '4d10+4',  size: "large", speed: 50, abilities: '161313071108'},
  4 => {name: 'giant rat', challange_rating: "1/8",  ac: 10,  hp: '2d6',  size: "small", speed: 30, abilities: '071511021004'}
}

#seeding process
seed_process('monster', monster_data)