class LearnController < ApplicationController
  skip_before_action :require_login

  def aromas
  end

  def glossary
    @terms = TastingTerm.order(:term)
  end
end
