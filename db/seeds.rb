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

armor_data = {
  1 =>{name: 'padded', kind: 'light_armor', ac: '11', weight: 8, price: 500, description: ''},
  2 =>{name: 'leather', kind: 'light_armor', ac: '11', weight: 10, price: 1000, description: ''},
  3 =>{name: 'studded_leather', kind: 'light_armor', ac: '12', weight: 13, price: 4500, description: ''},
  
  4 =>{name: 'hide', kind: 'medium_armor', ac: '12', weight: 12, price: 1000, description: ''},
  5 =>{name: 'chain_shirt', kind: 'medium_armor', ac: '13', weight: 20, price: 3000, description: ''},
  6 =>{name: 'scale_mail', kind: 'medium_armor', ac: '14', weight: 45, price: 5000, description: ''},
  7 =>{name: 'breastplate', kind: 'medium_armor', ac: '14', weight: 20, price: 40000, description: ''},
  8 =>{name: 'half_plate', kind: 'medium_armor', ac: '15', weight: 40, price: 75000, description: ''},
  
  9 =>{name: 'ring_mail', kind: 'heavy_armor', ac: '14', weight: 40, price: 30000, description: ''},
  10 =>{name: 'chain_mail', kind: 'heavy_armor', ac: '16', weight: 55, price: 75000, description: ''},
  11 =>{name: 'splint', kind: 'heavy_armor', ac: '17', weight: 60, price: 20000, description: ''},
  12 =>{name: 'plate', kind: 'heavy_armor', ac: '18', weight: 65, price: 150000, description: ''},
  
  13 =>{name: 'shield', kind: 'shield', ac: '18', weight: 6, price: 1000, description: ''}
}

weapon_data = {
  1 => {name: 'shortsword', kind: 'martial', melee_or_ranged: 'melee', one_handed: true,  dmg: '1d6', price: 1000, weight: '2', description: ''},
  2 => {name: 'dart', kind: 'simple', melee_or_ranged: 'ranged', one_handed: true,  dmg: '1d4', price: 5, weight: '1/4', description: ''},
  3 => {name: 'longbow', kind: 'martial', melee_or_ranged: 'ranged', one_handed: false,  dmg: '1d8', price: 5000, weight: '2', description: ''},
  4 => {name: 'handaxe', kind: 'simple', melee_or_ranged: 'both', one_handed: true,  dmg: '1d4', price: 500, weight: '2', description: ''},
  5 => {name: 'javelin', kind: 'simple', melee_or_ranged: 'both', one_handed: true,  dmg: '1d6', price: 50, weight: '2', description: ''},
  6 => {name: 'greatclub', kind: 'simple', melee_or_ranged: 'melee', one_handed: false,  dmg: '1d8', price: 20, weight: '10', description: ''},
  7 => {name: 'longsword', kind: 'martial', melee_or_ranged: 'melee', one_handed: true,  dmg: '1d8', price: 1500, weight: '3', description: ''},
  8 => {name: 'rapier', kind: 'martial', melee_or_ranged: 'melee', one_handed: true,  dmg: '1d8', price: 2500, weight: '2', description: ''},
  9 => {name: 'shortbow', kind: 'simple', melee_or_ranged: 'ranged', one_handed: false,  dmg: '1d6', price: 1000, weight: '2', description: ''},
  10 => {name: 'dagger', kind: 'simple', melee_or_ranged: 'melee', one_handed: true,  dmg: '1d4', price: 200, weight: '1', description: ''},
  11 => {name: 'light_crossbow', kind: 'simple', melee_or_ranged: 'ranged', one_handed: false,  dmg: '1d8', price: 2500, weight: '5', description: ''},
  12 => {name: 'quarterstaff', kind: 'simple', melee_or_ranged: 'melee', one_handed: true,  dmg: '1d6', price: 20, weight: '4', description: ''},
  13 => {name: 'mace', kind: 'simple', melee_or_ranged: 'melee', one_handed: true,  dmg: '1d6', price: 500, weight: '4', description: ''},
  14 => {name: 'battleaxe', kind: 'martial', melee_or_ranged: 'melee', one_handed: true,  dmg: '1d8', price: 1000, weight: '4', description: ''}
}

propriety_data = {
  1 => {name:'dis:_sneak', description: 'dis:_sneak_DESC'},
  2 => {name:'min_str:_13', description: 'min_str:_13_DESC'},
  3 => {name:'min_str:_15', description: 'min_str:_15_DESC'},
  4 => {name:'max_dex_bonus:_2', description: 'max_dex_bonus:_2_DESC'},
  5 => {name:'ammunition', description: 'ammunition_DESC'},
  6 => {name:'finesse', description: 'finesse_DESC'},
  7 => {name:'heavy', description: 'heavy_DESC'},
  8 => {name:'light', description: 'light_DESC'},
  9 => {name:'loading', description: 'loading_DESC'},
  10 => {name:'range_5_15', description: 'range_5_15_DESC'},
  11 => {name:'range_20_60', description: 'range_20_60_DESC'},
  12 => {name:'range_25_100', description: 'range_25_100_DESC'},
  12 => {name:'range_30_120', description: 'range_30_120_DESC'},
  13 => {name:'range_80_320', description: 'range_80_320_DESC'},
  14 => {name:'range_100_400', description: 'range_100_400_DESC'},
  15 => {name:'range_150_600', description: 'range_150_600_DESC'},
  16 => {name:'reach', description: 'reach_DESC'},
  17 => {name:'special_lance', description: 'special_lance_DESC'},
  18 => {name:'special_net', description: 'special_net_DESC'},
  19 => {name:'throw', description: 'throw_DESC'},
  20 => {name:'versatile_1d8', description: 'versatile_1d8_DESC'},
  21 => {name:'versatile_1d10', description: 'versatile_1d10_DESC'}
}

#seeding process
seed_process('monster', monster_data)
seed_process('armor', armor_data)
seed_process('weapon', weapon_data)
seed_process('propriety', propriety_data)
