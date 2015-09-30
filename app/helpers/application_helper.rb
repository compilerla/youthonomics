module ApplicationHelper
  def country_data
    Country.all.to_json.html_safe
  end
end
