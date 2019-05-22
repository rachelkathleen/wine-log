class Country < ApplicationRecord
  has_many :wines
  has_many :regions
  has_many :varietals, through: :wines

  validates :country_name, presence: true
  validates :country_name, uniqueness: true
end
