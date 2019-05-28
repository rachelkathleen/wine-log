class WinesController < ApplicationController
  before_action :require_login


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

  def show
    @wine = Wine.find(params[:id])
    # if params[:user_id]
    #   @user.id = @wine.user_id
    # end
  end

  def create
    @wine = Wine.new(wine_params)
    binding.pry
    if @wine.save
      redirect_to @wine
    else
      render :new
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      redirect_to wine_path(@wine)
    else
      render :edit
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to root_path
  end

  private

  def wine_params # strong parameters
    params.require(:wine).permit(:picture, :varietal_id, :producer, :wine_name, :wine_type,
      :country_id, :subregion_id, :organic, :biodynamic, :date_added, :price_range,
      :user_id, :vintage, :rating, :notes, :favorite, :checkbox_value, aroma_ids:[],
      tasting_term_ids:[], varietal_attributes: [:varietal_name], country_attributes: [:country_name])
  end
end
