# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
Style.destroy_all

# add style info to db
styles_csv = File.read(Rails.root.join('lib', 'seeds', 'styles.csv'))
styles_csv_parsed = CSV.parse(styles_csv, headers: true)

styles_csv_parsed.each do |row|
  Style.create(name: row.to_hash['style_name'])
  puts "Added value: #{row.to_hash['style_name']} to Style Table"
end

