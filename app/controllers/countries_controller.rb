class CountriesController < ApplicationController
  def index
    render json: Country.all
  end

  def show
  end
end