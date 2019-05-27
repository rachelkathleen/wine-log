class LearnController < ApplicationController
  skip_before_action :require_login

  def aromas
  end

  def glossary
  end
end
