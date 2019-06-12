class VarietalsController < ApplicationController
  def show
    @varietal = Varietal.find(params[:id])
  end

  def index
    @varietals = Varietal.all
  end

  def new
    @varietal = Varietal.new
  end

  def create
    @varietal = Varietal.create(varietal_params)
  end

  private

  def varietal_params
    params.require(:varietal).permit(:varietal_name, wines_attributes: [:wine_id])
  end
end
