class WinesController < ApplicationController
  before_action :require_login

  def index
    if params[:country_id] && country = Country.find_by_id(params[:country_id])
      @wines = Country.find_by_id(params[:country_id])
    else
      @wines = Wine.all
    end
    render json: @wines, status: 201
  end

  def new
    #new for regular and nested route
    if params[:country_id] && country = Country.find_by_id(params[:country_id])
      @wine = country.wines.build
    else
      @wine = Wine.new
      @wine.build_country
    end
  end

  # def show
  #   @wine = Wine.find(params[:id])
  #   if params[:country_id] && params[:country_id].to_i != @wine.country_id
  #     redirect_to countries_path
  #   end
  # end

  def show
    @wine = Wine.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @wine, status: 200 }
    end
  end

  def create
    @wine = current_user.wines.build(wine_params)
    if @wine.save
      render json: @wine, status: 201
    else
      render json: {errors: @wine.errors.full_messages}
    end
  end

  def edit
    @wine = Wine.find(params[:id])
    if @wine.user_id != current_user.id
      flash[:error] = "Sorry, you can only edit wines in your cellar."
      redirect_to home_path
    end
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.user_id != current_user.id
      flash[:error] = "Sorry, you can only edit wines in your cellar."
      redirect_to home_path
    end
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
      :country_id, :price_range, :user_id, :vintage, :rating, :notes, :favorite, :checkbox_value, aroma_ids:[],
      tasting_term_ids:[], varietal_attributes: [:varietal_name], country_attributes: [:country_name])
  end
end
