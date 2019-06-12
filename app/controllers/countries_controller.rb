class CountriesController < ApplicationController
  skip_before_action :require_login

  def index
    # creates list of countries in alphabetical order
    # displays full list if params is empty
    @countries = params[:search] ? Country.country_search(params[:search]) : Country.order(:country_name)
  end
end
