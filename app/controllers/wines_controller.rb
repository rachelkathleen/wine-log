class WinesController < ApplicationController
  before_action :require_login


  # def index
  #   if params[:user_id]
  #     @wines = User.find(params[:user_id]).wines
  #   elsif  params[:search]
  #     @wines = Wines.wine_search.(params[:search])
  #   else
  #     @wines = Wine.all
  #   end
  # end

  def new
    @wine = Wine.new
  end

  def new
    if params[:country_id] && country = Country.find_by_id(params[:country_id])
      @wine = country.wines.build
    else
      @wine = Wine.new
      @wine.build_country
    end
  end

  def show
    @wine = Wine.find(params[:id])
    # if @wine.country != @country
    if params[:country_id] && params[:country_id].to_i != @wine.country_id
      redirect_to countries_path
    end
  end

  def create
    @wine = current_user.wines.build(wine_params)
    # @wine = Wine.new(wine_params)
    # need to re-add to wine form <%= f.hidden_field :user_id, :value => current_user.id %>
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
    unless @wine.user_id = current_user.id
      flash[:error] = "Sorry, you can only edit wines in your cellar."
      redirect_to wine_path(@wine)
    end

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
