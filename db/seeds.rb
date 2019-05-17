require 'nokogiri'
require 'open-uri'
SITE = "https://www.jancisrobinson.com/learn/grape-varieties/"

red_page = Nokogiri::HTML(open(SITE+"red"))
white_page = Nokogiri::HTML(open(SITE+"white"))

grapes = []

red_nodeset = red_page.css(".info-table li a")
red_nodeset.each do |node|
  grapes << node.attr("href").split("/").last.gsub("-", " ").capitalize
end

white_nodeset = white_page.css(".info-table li a")
white_nodeset.each do |node|
  grapes << node.attr("href").split("/").last.gsub("-", " ").capitalize
end

grapes.uniq.each do |grape|
  Varietal.create(varietal_name: grape)
end


Aroma.create(aroma_name: "Burning rubber")
Aroma.create(aroma_name: "Burnt toast")
Aroma.create(aroma_name: "Coffee")
Aroma.create(aroma_name: "Smoky")
Aroma.create(aroma_name: "Toasted bread")
Aroma.create(aroma_name: "Acetaldehyde")
Aroma.create(aroma_name: "Rotten eggs")
Aroma.create(aroma_name: "Struck match")
Aroma.create(aroma_name: "Earthy")
Aroma.create(aroma_name: "Mold")
Aroma.create(aroma_name: "Floral")
Aroma.create(aroma_name: "Elderflower")
Aroma.create(aroma_name: "Orange blossom")
Aroma.create(aroma_name: "Rose")
Aroma.create(aroma_name: "Violet")
Aroma.create(aroma_name: "Fruity")
Aroma.create(aroma_name: "Berry")
Aroma.create(aroma_name: "Citrus")
Aroma.create(aroma_name: "Lactic")
Aroma.create(aroma_name: "Yeasty")
Aroma.create(aroma_name: "Mineral")
Aroma.create(aroma_name: "Flint")
Aroma.create(aroma_name: "Petrol/kerosene")
Aroma.create(aroma_name: "Wet stones")
Aroma.create(aroma_name: "Almond")
Aroma.create(aroma_name: "Marzipan")
Aroma.create(aroma_name: "Chestnut")
Aroma.create(aroma_name: "Coconut")
Aroma.create(aroma_name: "Hazelnuts")
Aroma.create(aroma_name: "Black pepper")
Aroma.create(aroma_name: "Liquorice")
Aroma.create(aroma_name: "Spicy")
Aroma.create(aroma_name: "Vanilla")
Aroma.create(aroma_name: "Barley sugar")
Aroma.create(aroma_name: "Biscuit")
Aroma.create(aroma_name: "Caramel")
Aroma.create(aroma_name: "Chocolate")
Aroma.create(aroma_name: "Honey")
Aroma.create(aroma_name: "Molasses")
Aroma.create(aroma_name: "Straw")
Aroma.create(aroma_name: "Tea")
Aroma.create(aroma_name: "Tobacco")
Aroma.create(aroma_name: "Currant leaves")
Aroma.create(aroma_name: "Eucalyptus")
Aroma.create(aroma_name: "Geranium leaves")
Aroma.create(aroma_name: "Grassy")
Aroma.create(aroma_name: "Green pepper")
Aroma.create(aroma_name: "Mint")
Aroma.create(aroma_name: "Nettles")
Aroma.create(aroma_name: "Oaky")
Aroma.create(aroma_name: "Pine")
Aroma.create(aroma_name: "Wet wood")
Aroma.create(aroma_name: "Bacon fat")
Aroma.create(aroma_name: "Leather")
Aroma.create(aroma_name: "Game")
Aroma.create(aroma_name: "Meaty")


Country.create(country_name: "Italy")
Country.create(country_name: "France")
Country.create(country_name: "Portugal")
Country.create(country_name: "Spain")
Country.create(country_name: "United Kingdom")
Country.create(country_name: "Germany")
Country.create(country_name: "Chile")
Country.create(country_name: "Argentina")
Country.create(country_name: "United States")
Country.create(country_name: "Canada")
Country.create(country_name: "South Africa")
Country.create(country_name: "Australia")
Country.create(country_name: "New Zealand")
