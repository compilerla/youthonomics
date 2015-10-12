class AddMoreCols < ActiveRecord::Migration
  def change
    add_column :countries, :rank_ec, :integer
    add_column :countries, :conjuncture, :integer
    add_column :countries, :sustainability, :integer
    add_column :countries, :rank_l, :integer
    add_column :countries, :entrywages, :integer
    add_column :countries, :skills, :integer
    add_column :countries, :wages, :integer
    add_column :countries, :financial_vulnerability, :integer
    add_column :countries, :housing, :integer
    add_column :countries, :rank_pol, :integer
    add_column :countries, :marginal, :integer
    add_column :countries, :implicitweight, :integer
    add_column :countries, :policymaking, :integer
    add_column :countries, :rank_pf, :integer
    add_column :countries, :explicit, :integer
    add_column :countries, :implicit, :integer
    add_column :countries, :rank_hwb, :integer
    add_column :countries, :social, :integer
    add_column :countries, :individual, :integer
    add_column :countries, :freedom, :integer
  end
end
