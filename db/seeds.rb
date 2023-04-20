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
  puts message(object.pluralize(2).humanize)
  table = eval(object.camelize)
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

combat_equipment_data = {
  1 =>{name: 'padded', kind: 'light_armor', ac: '11', dmg: '', weight: 8, price: 500, description: ''},
  2 =>{name: 'leather', kind: 'light_armor', ac: '11', dmg: '', weight: 10, price: 1000, description: ''},
  3 =>{name: 'studded leather', kind: 'light_armor', ac: '12', dmg: '', weight: 13, price: 4500, description: ''},
  
  4 =>{name: 'hide', kind: 'medium_armor', ac: '12', dmg: '', weight: 12, price: 1000, description: ''},
  5 =>{name: 'chain shirt', kind: 'medium_armor', ac: '13', dmg: '', weight: 20, price: 3000, description: ''},
  6 =>{name: 'scale mail', kind: 'medium_armor', ac: '14', dmg: '', weight: 45, price: 5000, description: ''},
  7 =>{name: 'breastplate', kind: 'medium_armor', ac: '14', dmg: '', weight: 20, price: 40000, description: ''},
  8 =>{name: 'half plate', kind: 'medium_armor', ac: '15', dmg: '', weight: 40, price: 75000, description: ''},
  
  9 =>{name: 'ring mail', kind: 'heavy_armor', ac: '15', dmg: '', weight: 40, price: 30000, description: ''},
  10 =>{name: 'chain mail', kind: 'heavy_armor', ac: '16', dmg: '', weight: 55, price: 75000, description: ''},
  11 =>{name: 'splint', kind: 'heavy_armor', ac: '17', dmg: '', weight: 60, price: 20000, description: ''},
  12 =>{name: 'plate', kind: 'heavy_armor', ac: '18', dmg: '', weight: 65, price: 150000, description: ''}
  
}

#seeding process
seed_process('monster', monster_data)
seed_process('combat_equipment', combat_equipment_data)