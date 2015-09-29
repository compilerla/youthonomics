# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

file = Rails.root.join("db", "youtho_index_main_metrics.json")
opened = File.read(file)
data_hash = JSON.parse(opened)
data_hash.each do |country_data|
  Country.create(country_data)
end