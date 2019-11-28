class LearnController < ApplicationController
  skip_before_action :require_login

  def aromas
    #index of aromas with or without search params
    @aromas = params[:search] ? Aroma.aroma_search(params[:search]) : Aroma.order(:aroma_name)
    # render :json => @aromas
  end

  def glossary
    #index of tasting terms with or without search param
    @terms = params[:search] ? TastingTerm.glossary_search(params[:search]) : TastingTerm.order(:term)
  end

  def about
  end
end
