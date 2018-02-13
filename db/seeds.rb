# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Style.destroy_all
Brewery.destroy_all
# Beer.destroy_all

# add style info to db
styles_csv = File.read(Rails.root.join('lib', 'seeds', 'styles.csv'))
styles_csv_parsed = CSV.parse(styles_csv, headers: true)

styles_csv_parsed.each do |row|
  style = Style.create(name: row.to_hash['style_name'])
  puts "Added value: #{row.to_hash['style_name']} to Style Table"
  if style.save
    puts "Added value: #{row.to_hash['style_name']} to Style Table"
  else
    puts "Could not add value: #{row.to_hash['style_name']} to Style Table"
  end
end

# add brewery info to db
brewery_csv = File.read(Rails.root.join('lib', 'seeds', 'breweries.csv'))
brewery_csv_parsed = CSV.parse(brewery_csv, headers: true)
brewery_csv_parsed.each do |row|
  brew = Brewery.new(name: row.to_hash['name'],
                     address: row.to_hash['address1'],
                     city: row.to_hash['city'],
                     state: row.to_hash['state'],
                     country: row.to_hash['country'])
  if brew.save
    puts "Added value: #{row.to_hash['name']} to Brewery Table"
  else
    puts "Could not add value: #{row.to_hash['name']} to Brewery Table"
  end
end


# add beer info to db
# beers_csv = File.read(Rails.root.join('lib', 'seeds', 'beers.csv'))
# beers_csv_parsed = CSV.parse(beers_csv, headers: true)
# beers_csv_parsed.each do |row|
#   beer = Brewery.new(name: row.to_hash['name'],
#                      description: row.to_hash['description'],
#                      style_id: row.to_hash['style_id'],
#                      abv: row.to_hash['abv'],
#                      brewery_id: row.to_hash['brewery_id'])
#   if beer.save
#     puts "Added value: #{row.to_hash['name']} to Beer Table"
#   else
#     puts "Could not add value: #{row.to_hash['name']} to Beer Table"
#   end
# end