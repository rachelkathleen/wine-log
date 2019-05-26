class CountriesController < ApplicationController
  def index
    @countries = Country.order(:country_name)
  end

  def show
    @country = Country.find(params[:id])
  end
end
