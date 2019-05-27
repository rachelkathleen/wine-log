class WineAromasController < ApplicationController
  def new
  end

  def create
    binding.pry
    if params[:aroma_ids]
      params[:aroma_ids].each do |aroma_id|
        wine_id = params[:wine_id]
        @winearoma = WineAroma.create(wine_id: wine_id, aroma_id: aroma_id)
      end
      redirect '/home'
    else
      @winearoma = WineAroma.create(params)
      if @userpark.save
          redirect "/home"
        else
          flash[:error] = "Sorry, there is a problem"
        end
      end
    end
end
