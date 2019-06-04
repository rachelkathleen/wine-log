class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :require_login
end
