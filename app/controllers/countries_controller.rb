class CountriesController < ApplicationController
  skip_before_action :require_login

  def index
    @countries = Country.order(:country_name)
  end

end
