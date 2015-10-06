module CountryHelper
  def current_country_data
    if controller.controller_name == 'countries' && controller.action_name == 'show'
      return Country.find(params[:id]).to_json.html_safe
    end

    return nil
  end
end