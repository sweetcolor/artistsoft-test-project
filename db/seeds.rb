# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TODO move generator to lib

RECORDS_COUNT = 20
MIN_NAME_LEN = 4
MAX_NAME_LEN = 8
CITIES = 3
STREETS_IN_CITY = 4

def rand_name_generator
  ('a'..'z').to_a.shuffle[1..rand(MIN_NAME_LEN..MAX_NAME_LEN)].join.capitalize
end

def rand_date_generator
  Date.new(rand(1990..2000)) + rand(0..365).days
end

def rand_address_generator(cities, streets_in_cities)
  chosen_city = cities.sample
  chosen_street = streets_in_cities[chosen_city].sample

  "#{rand(1..400)}, #{chosen_street} Street, #{chosen_city} City"
end

cities = Array.new(CITIES) { rand_name_generator }
streets_in_cities = Hash[cities.collect{ |k| [k, Array.new(STREETS_IN_CITY) { rand_name_generator }] }]

RECORDS_COUNT.times.each do |i|
  User.create first_name: "User #{i}",
           last_name: rand_name_generator,
           birthday: rand_date_generator,
           address: rand_address_generator(cities, streets_in_cities)
end