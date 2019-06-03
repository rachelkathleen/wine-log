module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end

  # def scrape_grapes
  #   require 'nokogiri'
  #   require 'open-uri'
  #   SITE = "https://www.jancisrobinson.com/learn/grape-varieties/"
  #
  #   red_page = Nokogiri::HTML(open(SITE+"red"))
  #   white_page = Nokogiri::HTML(open(SITE+"white"))
  #
  #   grapes = []
  #
  #   red_nodeset = red_page.css(".info-table li a")
  #   red_nodeset.each do |node|
  #     grapes << node.attr("href").split("/").last.gsub("-", " ").capitalize
  #   end
  #
  #   white_nodeset = white_page.css(".info-table li a")
  #   white_nodeset.each do |node|
  #     grapes << node.attr("href").split("/").last.gsub("-", " ").capitalize
  #   end
  #
  #   grapes.uniq.each do |grape|
  #     Varietal.create(varietal_name: grape)
  #   end
  # end
end
