class AddCoordsToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :lat, :float
    add_column :countries, :lng, :float
  end
end
