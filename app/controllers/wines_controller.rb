class WinesController < ApplicationController
  before_action :check_for_logged_in


  def index
    if params[:user_id]
      @wines = User.find(params[:user_id]).wines
    else
      @wines = Wine.all
    end
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    binding.pry
    if @wine.save
      redirect_to @wine
    else
      render 'new'
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)

    redirect_to wine_path(@wine)
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to `/`
  end
  private

  def wine_params # strong parameters
    params.require(:wine).permit(:varietal_id, :producer, :wine_name, :type,
      :country_id, :subregion_id, :organic, :biodynamic, :date_added, :price_range,
      :user_id, :vintage, :rating, :notes, :favorite)
  end
end
