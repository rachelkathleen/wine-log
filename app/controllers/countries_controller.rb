class CountriesController < ApplicationController
  skip_before_action :require_login

  def index
    @countries = params[:search] ? Country.country_search(params[:search]) : Country.order(:country_name)
    # @countries = Country.order(:country_name)
    # if params[:search]
    #   @countries = Country.country_search(params[:search])
    # end
  end
end
