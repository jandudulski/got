# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

House.create([
  { name: 'Lannister' },
  { name: 'Stark' },
  { name: 'Baratheon' },
  { name: 'Greyjoy' },
  { name: 'Martel' },
  { name: 'Tyrell' },
  { name: 'Tully' },
  { name: 'Aegon' },
  { name: 'Bolton' },
  { name: 'Frey' },
  { name: 'Daenerys' },
  { name: 'Arryn' }
])

GameVersion.create([
  { name: 'Second Edition', min_players: 3, max_players: 6 },
  { name: 'Homemade', min_players: 6, max_players: 9 }
])
