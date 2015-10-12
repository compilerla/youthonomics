class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :youth_optimism
      t.integer :rank
      t.string :country
      t.integer :income
      t.integer :gni_pc
      t.integer :rank_now
      t.float :youthnow
      t.integer :rank_yo
      t.float :youthoutlook
      t.float :youtho_index
    end
  end
end
