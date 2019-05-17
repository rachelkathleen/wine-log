class Aroma < ApplicationRecord
  has_many :wine_aromas
  has_many :wines, through: :wine_aromas

  validates :aroma_name,  presence: true
  validates :aroma_name,  uniqueness: true
end
