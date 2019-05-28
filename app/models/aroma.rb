class Aroma < ApplicationRecord
  has_many :wine_aromas
  has_many :wines, through: :wine_aromas

  validates :aroma_name,  presence: true
  validates :aroma_name,  uniqueness: true

  def self.aroma_search(search)
    self.where('aroma_name ILIKE ?', "%#{search}%")
  end
end
