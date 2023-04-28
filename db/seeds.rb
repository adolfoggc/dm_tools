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
  while index < data.count do
    index += 1
    table.create(data[index])
    added += 1
  end

  puts 'Added ' + added.to_s + ' '+ object.pluralize(added).humanize
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
  1 => {name: 'shortsword', kind: 'martial', dmg: '1d6', price: 1000, weight: '2', description: ''},
  2 => {name: 'dart', kind: 'simple', dmg: '1d4', price: 5, weight: '1/4', description: ''},
  3 => {name: 'longbow', kind: 'martial', dmg: '1d8', price: 5000, weight: '2', description: ''},
  4 => {name: 'handaxe', kind: 'simple', dmg: '1d4', price: 500, weight: '2', description: ''},
  5 => {name: 'javelin', kind: 'simple', dmg: '1d6', price: 50, weight: '2', description: ''},
  6 => {name: 'greatclub', kind: 'simple', dmg: '1d8', price: 20, weight: '10', description: ''},
  7 => {name: 'longsword', kind: 'martial', dmg: '1d8', price: 1500, weight: '3', description: ''},
  8 => {name: 'rapier', kind: 'martial', dmg: '1d8', price: 2500, weight: '2', description: ''},
  9 => {name: 'shortbow', kind: 'simple', dmg: '1d6', price: 1000, weight: '2', description: ''},
  10 => {name: 'dagger', kind: 'simple', dmg: '1d4', price: 200, weight: '1', description: ''},
  11 => {name: 'light_crossbow', kind: 'simple', dmg: '1d8', price: 2500, weight: '5', description: ''},
  12 => {name: 'quarterstaff', kind: 'simple', dmg: '1d6', price: 20, weight: '4', description: ''},
  13 => {name: 'mace', kind: 'simple', dmg: '1d6', price: 500, weight: '4', description: ''},
  14 => {name: 'battleaxe', kind: 'martial', dmg: '1d8', price: 1000, weight: '4', description: ''}
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
  13 => {name:'range_30_120', description: 'range_30_120_DESC'},
  14 => {name:'range_80_320', description: 'range_80_320_DESC'},
  15 => {name:'range_100_400', description: 'range_100_400_DESC'},
  16 => {name:'range_150_600', description: 'range_150_600_DESC'},
  17 => {name:'reach', description: 'reach_DESC'},
  18 => {name:'special_lance', description: 'special_lance_DESC'},
  19 => {name:'special_net', description: 'special_net_DESC'},
  20 => {name:'throw', description: 'throw_DESC'},
  21 => {name:'two_handed', description: 'two_handed_DESC'},
  22 => {name:'versatile_1d8', description: 'versatile_1d8_DESC'},
  23 => {name:'versatile_1d10', description: 'versatile_1d10_DESC'},
  24 => {name:'no_dex_bonus', description: 'no_dex_bonus_DESC'}
}

armor_proprieties_data = {
  1 => {armor:  Armor.find_by(name: 'padded'), propriety: Propriety.find_by(name: 'dis:_sneak')},
  2 => {armor:  Armor.find_by(name: 'hide'), propriety: Propriety.find_by(name: 'max_dex_bonus:_2')},
  3 => {armor:  Armor.find_by(name: 'chain_shirt'), propriety: Propriety.find_by(name: 'max_dex_bonus:_2')},
  4 => {armor:  Armor.find_by(name: 'scale_mail'), propriety: Propriety.find_by(name: 'dis:_sneak')},
  5 => {armor:  Armor.find_by(name: 'scale_mail'), propriety: Propriety.find_by(name: 'max_dex_bonus:_2')},
  6 => {armor:  Armor.find_by(name: 'breastplate'), propriety: Propriety.find_by(name: 'max_dex_bonus:_2')},
  7 => {armor:  Armor.find_by(name: 'half_plate'), propriety: Propriety.find_by(name: 'dis:_sneak')},
  8 => {armor:  Armor.find_by(name: 'half_plate'), propriety: Propriety.find_by(name: 'max_dex_bonus:_2')},
  9 => {armor:  Armor.find_by(name: 'ring_mail'), propriety: Propriety.find_by(name: 'dis:_sneak')},
  10 => {armor:  Armor.find_by(name: 'ring_mail'), propriety: Propriety.find_by(name: 'no_dex_bonus')},
  11 => {armor:  Armor.find_by(name: 'chain_mail'), propriety: Propriety.find_by(name: 'dis:_sneak')},
  12 => {armor:  Armor.find_by(name: 'chain_mail'), propriety: Propriety.find_by(name: 'no_dex_bonus')},
  13 => {armor:  Armor.find_by(name: 'chain_mail'), propriety: Propriety.find_by(name: 'min_str:_13')},
  14 => {armor:  Armor.find_by(name: 'splint'), propriety: Propriety.find_by(name: 'dis:_sneak')},
  15 => {armor:  Armor.find_by(name: 'splint'), propriety: Propriety.find_by(name: 'no_dex_bonus')},
  16 => {armor:  Armor.find_by(name: 'splint'), propriety: Propriety.find_by(name: 'min_str:_15')},
  17 => {armor:  Armor.find_by(name: 'plate'), propriety: Propriety.find_by(name: 'dis:_sneak')},
  18 => {armor:  Armor.find_by(name: 'plate'), propriety: Propriety.find_by(name: 'no_dex_bonus')},
  19 => {armor:  Armor.find_by(name: 'plate'), propriety: Propriety.find_by(name: 'min_str:_15')}
}

weapon_proprieties_data = {
  1 => {weapon: Weapon.find_by(name: 'shortsword'), propriety: Propriety.find_by(name: 'finesse') },
  2 => {weapon: Weapon.find_by(name: 'shortsword'), propriety: Propriety.find_by(name: 'light') },
  3 => {weapon: Weapon.find_by(name: 'dart'), propriety: Propriety.find_by(name: 'finesse') },
  4 => {weapon: Weapon.find_by(name: 'dart'), propriety: Propriety.find_by(name: 'range_80_320') },
  5 => {weapon: Weapon.find_by(name: 'longbow'), propriety: Propriety.find_by(name: 'ammunition') },
  6 => {weapon: Weapon.find_by(name: 'longbow'), propriety: Propriety.find_by(name: 'range_150_600') },
  7 => {weapon: Weapon.find_by(name: 'longbow'), propriety: Propriety.find_by(name: 'heavy') },
  8 => {weapon: Weapon.find_by(name: 'longbow'), propriety: Propriety.find_by(name: 'two_handed') },
  9 => {weapon: Weapon.find_by(name: 'handaxe'), propriety: Propriety.find_by(name: 'light') },
  10 => {weapon: Weapon.find_by(name: 'handaxe'), propriety: Propriety.find_by(name: 'twrow') },
  11 => {weapon: Weapon.find_by(name: 'handaxe'), propriety: Propriety.find_by(name: 'range_20_60') },
  12 => {weapon: Weapon.find_by(name: 'javelin'), propriety: Propriety.find_by(name: 'throw') },
  13 => {weapon: Weapon.find_by(name: 'javelin'), propriety: Propriety.find_by(name: 'range_30_120') },
  14 => {weapon: Weapon.find_by(name: 'greatclub'), propriety: Propriety.find_by(name: 'two_handed') },
  15 => {weapon: Weapon.find_by(name: 'longsword'), propriety: Propriety.find_by(name: 'versatile_1d10') },
  16 => {weapon: Weapon.find_by(name: 'rapier'), propriety: Propriety.find_by(name: 'finesse') },
  17 => {weapon: Weapon.find_by(name: 'shortbow'), propriety: Propriety.find_by(name: 'ammunition') },
  18 => {weapon: Weapon.find_by(name: 'shortbow'), propriety: Propriety.find_by(name: 'range_80_320') },
  19 => {weapon: Weapon.find_by(name: 'shortbow'), propriety: Propriety.find_by(name: 'two_handed') },
  20 => {weapon: Weapon.find_by(name: 'dagger'), propriety: Propriety.find_by(name: 'finesse') },
  21 => {weapon: Weapon.find_by(name: 'dagger'), propriety: Propriety.find_by(name: 'light') },
  22 => {weapon: Weapon.find_by(name: 'dagger'), propriety: Propriety.find_by(name: 'throw') },
  23 => {weapon: Weapon.find_by(name: 'dagger'), propriety: Propriety.find_by(name: 'range_20_60') },
  24 => {weapon: Weapon.find_by(name: 'light_crossbow'), propriety: Propriety.find_by(name: 'ammunition') },
  25 => {weapon: Weapon.find_by(name: 'light_crossbow'), propriety: Propriety.find_by(name: 'range_80_320') },
  26 => {weapon: Weapon.find_by(name: 'light_crossbow'), propriety: Propriety.find_by(name: 'loading') },
  27 => {weapon: Weapon.find_by(name: 'light_crossbow'), propriety: Propriety.find_by(name: 'two_handed') },
  28 => {weapon: Weapon.find_by(name: 'quarterstaff'), propriety: Propriety.find_by(name: 'versatile_1d8') },
  29 => {weapon: Weapon.find_by(name: 'battleaxe'), propriety: Propriety.find_by(name: 'versatile_1d10') }
}

#seeding process
seed_process('monster', monster_data)
seed_process('armor', armor_data)
seed_process('weapon', weapon_data)
seed_process('propriety', propriety_data)
seed_process('armor_propriety', armor_proprieties_data)
seed_process('weapon_propriety', weapon_proprieties_data)