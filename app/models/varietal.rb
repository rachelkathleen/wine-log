class Varietal < ApplicationRecord
  has_many :wines

  validates :varietal_name, presence: true
  validates :varietal_name, uniqueness: true
end
