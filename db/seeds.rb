# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'Removing existing data'
Style.destroy_all
Style.reset_pk_sequence
Brewery.destroy_all
Brewery.reset_pk_sequence
Beer.destroy_all
Beer.reset_pk_sequence

# add style info to db
styles_csv = File.read(Rails.root.join('lib', 'seeds', 'styles.csv'))
styles_csv_parsed = CSV.parse(styles_csv, headers: true)

brewery_csv = File.read(Rails.root.join('lib', 'seeds', 'breweries.csv'))
brewery_csv_parsed = CSV.parse(brewery_csv, headers: true)

beers_csv = File.read(Rails.root.join('lib', 'seeds', 'beers.csv'))
beers_csv_parsed = CSV.parse(beers_csv, headers: true)

# Prints a text-based "spinner" element while work occurs.
spinner = Enumerator.new do |e|
  loop do
    e.yield '|'
    e.yield '/'
    e.yield '-'
    e.yield '\\'
  end
end

count = styles_csv_parsed.length

puts 'Creating Style records'
styles_csv_parsed.each do |row|
  Style.create(name: row.to_hash['style_name'])
  printf("\r  Creating Records: %s", spinner.next)
  sleep(0.1)
end
puts " >> Created #{Style.count} records"

#brewery
puts 'Creating Brewery Records'
brewery_csv_parsed.each do |item|
  Brewery.create(name: item.to_hash['name'],
                 address: item.to_hash['address1'],
                 city: item.to_hash['city'],
                 state: item.to_hash['state'],
                 country: item.to_hash['country'])
  printf("\r  Creating records: %s", spinner.next)
end
puts " >> Created #{Brewery.count} records"


beers_csv_parsed.each do |thing|

  random_description = "Surprisingly contains #{Faker::Beer.malts}"

  style_ref = Style.find(thing.to_hash['style_id'])
  brewery = Brewery.find(thing.to_hash['brewery_id'])
  beer = brewery.beers.create(name: thing.to_hash['name'],
                              description: random_description,
                              style: style_ref,
                              abv: thing.to_hash['abv'])

  printf("\r  Creating records: %s", spinner.next)
end
puts " >> Created  #{Beer.count} records"

puts Brewery.first.inspect
puts Style.first.inspect
puts Beer.first.inspect
