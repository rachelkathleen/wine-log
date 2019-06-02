module WinesHelper
  def wine_seacher_link
    @link = "https://www.wine-searcher.com/find/#{@wine.producer}+#{@wine.wine_name}+#{@wine.vintage}"
  end

  def show_image
    if @wine.picture.attached?

      image_tag(@wine.picture, class: "picture", style: "width:128px; height:128px;", alt: "your_image")
    end
  end

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
end
