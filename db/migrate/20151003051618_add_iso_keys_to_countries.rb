class AddIsoKeysToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :country_iso, :string
  end
end
