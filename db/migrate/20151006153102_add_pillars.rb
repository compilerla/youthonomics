class AddPillars < ActiveRecord::Migration
  def change
    add_column :countries, :political_weight, :integer
    add_column :countries, :early_education, :integer
    add_column :countries, :university_and_skills, :integer
    add_column :countries, :access_to_employment, :integer
    add_column :countries, :work_and_living_conditions, :integer
    add_column :countries, :wellbeing, :integer
    add_column :countries, :health, :integer
    add_column :countries, :public_finance, :integer
    add_column :countries, :economic_opportunities, :integer
  end
end
