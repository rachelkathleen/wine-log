class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :require_login
  skip_before_action :verify_authenticity_token
end
