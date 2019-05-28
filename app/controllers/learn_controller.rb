class LearnController < ApplicationController
  skip_before_action :require_login

  def aromas
    @aromas = Aroma.order(:aroma_name)
  end

  def glossary
    if params[:search]
      @terms = TastingTerm.glossary_search(params[:search])
    else
      @terms = TastingTerm.order(:term)
    end
  end

  private
  def tasting_term_params
    params.require(:tasting_term).permit(:term, :definition)
  end
end
