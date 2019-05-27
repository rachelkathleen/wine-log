module WinesHelper
  def wine_seacher_link
    @link = "https://www.wine-searcher.com/find/#{@wine.producer}+#{@wine.wine_name}+#{@wine.vintage}"
  end

  def show_image
    if @wine.picture.attached?
      "image_tag(@wine.picture, width: 200)"
    else
      "https://www.bruniglass.com/assets/Uploads/products/14973.jpg"
    end
  end
end
