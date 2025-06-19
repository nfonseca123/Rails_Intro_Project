# db/seeds.rb

require 'faker'
require 'net/http'
require 'json'
require 'uri'

def fetch_countries
  url = URI('https://countriesnow.space/api/v0.1/countries')
  response = Net::HTTP.get(url)
  json = JSON.parse(response)
  json['data']
end

def random_pick(array)
  array.sample
end

def get_random_location
  countries = fetch_countries
  country = random_pick(countries)
  city = random_pick(country['cities'] || [])
  { country: country['country'], city: city }
end

puts 'Seeding countries, states, and users...'

50.times do
  location = get_random_location

  next unless location[:country] && location[:city]

  country = Country.find_or_create_by!(name: location[:country])

  state = State.find_or_create_by!(name: location[:city], country: country)

  # Create a user
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::Number.number(digits: 10),
    state: state
  )
end

puts 'Seeding complete.'
