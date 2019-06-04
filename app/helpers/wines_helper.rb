module WinesHelper
  
  #method to dynamic link on wine-searcher.com with wine name and producer
  def wine_seacher_link
    @link = "https://www.wine-searcher.com/find/#{@wine.producer}+#{@wine.wine_name}"
  end

  #method to show label image, if attached
  def show_image
    if @wine.picture.attached?
      image_tag(@wine.picture.service_url, alt: "your_image", height: "250", style: "border: 1px solid #220F24")
    end
  end

  ### HELPER METHODS FOR ORGANIZING WINE ATTRIBUTES ###
  def aroma_index
    Aroma.order(:aroma_name)
  end

  def country_index
    Country.order(:country_name)
  end

  def varietal_index
    Varietal.order(:varietal_name)
  end

  def term_index
    TastingTerm.order(:term)
  end
  ### END OF HELPER METHODS FOR ORGANIZING WINE ATTRIBUTES ###
end
