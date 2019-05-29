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

  def self.average_rating
    average(:rating)
  end

  def self.top_rated
    #want to return the wine type (white, red) with the highest average rating
    averages = {"Red" => Wine.red.average_rating.to_f,
                "White" => Wine.white.average_rating.to_f,
                "Rose"=> Wine.rose.average_rating.to_f,
                "Sparkling"=> Wine.sparkling.average_rating.to_f,
                "sweet"=> Wine.sweet.average_rating.to_f}
    top_type = averages.sort_by { |wine_type, avg| avg }.last[0]
    # top_type[0]
  end

  def self.most_bottles
    #want to return the wine type (white, red) with the highest count
    count = {"Red"=> Wine.red.count,
             "White"=> Wine.count,
             "Rose"=> Wine.rose.count,
             "Sparkling"=> Wine.sparkling.count,
              "Sweet"=>Wine.sweet.count}
    count.sort_by { |wine_type, count| count }.last[0]
  end

  def self.top_aromas
    wine_ids = Wine.is_favorite.pluck(:id) & Wine.highly_rated.pluck(:id)
    aroma_ids = WineAroma.where('wine_id IN (?)', wine_ids).pluck(:aroma_id)
    aromas = Aroma.where('id in (?)', aroma_ids)
    aromas.group(:id).order('COUNT(id) desc').limit(3).pluck(:aroma_name)
  end

  def self.top_terms
    wine_ids = Wine.is_favorite.pluck(:id) & Wine.highly_rated.pluck(:id)
    tasting_term_ids = WineTastingTerm.where('wine_id IN (?)', wine_ids).pluck(:tasting_term_id)
    terms = TastingTerm.where('id in (?)', tasting_term_ids)
    terms.group(:id).order('COUNT(id) desc').limit(3).pluck(:term)
  end

  def  varietal_attributes=(varietal_attributes)
    if varietal_attributes[:varietal_name].present?
       varietal = Varietal.find_or_create_by(varietal_attributes)
       self.varietal = varietal
    end
  end

  def  country_attributes=(country_attributes)
    if country_attributes[:country_name].present?
       country = country.find_or_create_by(country_attributes)
       self.country = country
    end
  end

  def self.wine_search(search)
    self.where('producer ILIKE :search or wine_name ILIKE :search or notes ILIKE :search or type ILIKE :search', search: "%#{search}%")
  end

end
