module WinesHelper
  def wine_seacher_link
    @link = "https://www.wine-searcher.com/find/#{@wine.producer}+#{@wine.wine_name}"
  end

  def show_image
    if @wine.picture.attached?
      image_tag(@wine.picture.service_url, alt: "your_image", height: "250", style: "border: 1px solid #220F24")
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
