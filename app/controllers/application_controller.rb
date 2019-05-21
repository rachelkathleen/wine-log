class ApplicationController < ActionController::Base
  include ApplicationHelper


  private
  
  def check_for_logged_in
    redirect_to '/' if !logged_in?
  end
end
