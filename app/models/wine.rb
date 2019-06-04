class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :varietal
  belongs_to :country
  has_many :wine_aromas
  has_many :aromas, through: :wine_aromas
  has_many :wine_tasting_terms
  has_many :tasting_terms, through: :wine_tasting_terms

  has_one_attached :picture

  accepts_nested_attributes_for :country, reject_if: :all_blank
  accepts_nested_attributes_for :varietal, reject_if: :all_blank

  validates :vintage, :user_id, :producer, :wine_name, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 10, greater_than: 0,  only_integer: true }

  scope :is_favorite, -> {where(favorite: true)}
  scope :order_by_rating, -> {order(:rating)}
  scope :highly_rated, -> {where("rating > ?", 7)}
  scope :red, -> {where(wine_type: "Red")}
  scope :white, -> {where(wine_type: "White")}
  scope :rose, -> {where(wine_type: "Rose")}
  scope :sweet, -> {where(wine_type: "Sweet")}
  scope :sparkling, -> {where(wine_type: "Sparkling")}
  scope :other, -> {where(wine_type: "other")}

  PRICE_RANGES = ["Less than $10", "$10 - $15", "$15 - $20",
  "$20 - $30", "$30 - $40", "$40 - $50", "$50 - $60", "$60 - $70",
  "$70 - $80", "$80 - $90", "$90 - $100", "Over $100",]

  WINE_TYPES = ["Red", "White", "Rose", "Sparkling", "Sweet", "Other"]

  ### SCOPE METHODS FOR QUERYING WINES ###
  # average rating for all wines
  def self.average_rating
    average(:rating)
  end

  # returns array of countries currently associated with wine objects
  def self.countries
    country_ids = Wine.pluck(:country_id)
    countries = Country.where('id IN (?)', country_ids).pluck(:country_name)
  end

  # returns most frequently appearing country
  def self.top_country
    country_ids = Wine.select(:country_id)
    country_id = country_ids.group(:id).order('COUNT(id) desc').limit(1)
    top_country = Country.find_by(id: country_id).country_name
  end

  # returns wine type with highest average rating
  def self.top_rated
    averages = {}
    WINE_TYPES.each do |type|
      averages[type] = Wine.where(wine_type: type).average_rating.to_f
    end
    top_type = averages.sort_by { |wine_type, avg| avg }.last[0]
  end

  # returns most common wine type
  def self.most_bottles
    count = {}
    WINE_TYPES.each do |type|
      count[type] = Wine.where(wine_type: type).count
    end
    count.sort_by { |wine_type, count| count }.last[0]
  end

  # returns top three aromas for wines that are highly rated or favorite,
  # based on count
  def self.top_aroma
    wine_ids = Wine.is_favorite.pluck(:id) & Wine.highly_rated.pluck(:id)
    aroma_ids = WineAroma.where('wine_id IN (?)', wine_ids).pluck(:aroma_id)
    aromas = Aroma.where('id in (?)', aroma_ids)
    aromas.group(:id).order('COUNT(id) desc').limit(3).pluck(:aroma_name)
  end

  # returns top three terms for wines that are highly rated or favorite,
  # based on count
  def self.top_terms
    wine_ids = Wine.is_favorite.pluck(:id) & Wine.highly_rated.pluck(:id)
    tasting_term_ids = WineTastingTerm.where('wine_id IN (?)', wine_ids).pluck(:tasting_term_id)
    terms = TastingTerm.where('id in (?)', tasting_term_ids)
    terms.group(:id).order('COUNT(id) desc').limit(3).pluck(:term)
  end

  ### END OF SCOPE METHODS FOR QUERYING WINES ###

  # custom setter to allow users to create new varietals in nested form
  def  varietal_attributes=(varietal_attributes)
    if varietal_attributes[:varietal_name].present?
       varietal = Varietal.find_or_create_by(varietal_attributes)
       self.varietal = varietal
    end
  end

  # custom setter to allow users to create new countries in nested form
  def  country_attributes=(country_attributes)
    if country_attributes[:country_name].present?

       country = Country.find_or_create_by(country_attributes)
       self.country = country
    end
  end

  # def self.wine_search(search)
  #   self.where('producer ILIKE :search or wine_name ILIKE :search or notes ILIKE :search or type ILIKE :search', search: "%#{search}%")
  # end

end
