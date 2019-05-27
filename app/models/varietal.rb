class Varietal < ApplicationRecord
  has_many :wines
  has_many :countries, through: :wines

  accepts_nested_attributes_for :wines

  validates :varietal_name, presence: true
  validates :varietal_name, uniqueness: true
end
