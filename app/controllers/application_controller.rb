class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :require_login

  private


  #
  # def check_for_logged_in
  #   redirect_to 'login_path if !logged_in?
  # end
end
