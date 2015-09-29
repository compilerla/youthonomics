class CountriesController < ApplicationController
  def index
    render json: Country.all
  end

  def show
    @country = Country.find(params[:id])

    render :cms_layout => 'country', :cms_blocks => @country.as_json
  end
end