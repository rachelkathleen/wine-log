module WinesHelper
  def wine_seacher_link
    @link = "https://www.wine-searcher.com/find/#{@wine.producer}+#{@wine.wine_name}+#{@wine.vintage}"
  end
end
