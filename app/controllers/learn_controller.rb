class LearnController < ApplicationController
  skip_before_action :require_login

  def aromas
    if params[:search]
      @aromas = Aroma.aroma_search(params[:search])
    else
      @aromas = Aroma.order(:aroma_name)
    end
  end

  def glossary
    if params[:search]
      @terms = TastingTerm.glossary_search(params[:search])
    else
      @terms = TastingTerm.order(:term)
    end
  end

  def about
  end
end
