module WinesHelper
  def wine_seacher_link
    @link = "https://www.wine-searcher.com/find/#{@wine.producer}+#{@wine.wine_name}+#{@wine.vintage}"
  end

  def show_image
    if @wine.picture.attached?
      image_tag(@wine.picture, class: "card-img-top", style: "width:128px;height:128px;", alt: "your_image")
    else
      image_tag("https://www.bruniglass.com/assets/Uploads/products/14973.jpg", class: "card-img-top", style: "width:128px;height:128px;", alt: "sample_image")
    end
  end

  def aroma_index
    Aroma.order(:aroma_name)
  end

  def country_index
    Country.order(:country_name)
  end
end
