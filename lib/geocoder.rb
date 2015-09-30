file = Rails.root.join("db", "youtho_index_main_metrics.json")
opened = File.read(file)
data_hash = JSON.parse(opened)
new_hash = []
data_hash.each do |country_data|
  puts country_data['country']
  search = Geocoder.search(country_data['country'])
  new_hash << country_data.merge({ "coords" => search.first.try(:coordinates) })
  sleep(0.2)
end

new_hash