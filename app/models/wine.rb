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
