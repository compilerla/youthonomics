# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  Country.all.destroy_all
  file = Rails.root.join("db", "youtho_index_main_metrics.json")
  opened = File.read(file)
  data_hash = JSON.parse(opened)
  data_hash.each do |country_data|
    if country_data['coords'].present?
      country_data['lat'] = country_data["coords"][0]
      country_data['lng'] = country_data["coords"][1]
      country_data.delete('coords')
      Country.create(country_data)
    end
  end

  file = Rails.root.join("db", "youtho_index_pillars.json")
  opened = File.read(file)
  pillars_hash = JSON.parse(opened)
  pillars_hash.each do |country_pillars|
    country = Country.find_by(country_iso: country_pillars["country"].upcase)
    next unless country
    country_pillars.each_pair do |key, val|
      next if key == 'country'
      country.send("#{key}=", val.to_i)
    end

    country.save
  end
end