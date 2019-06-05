class Country < ApplicationRecord
  has_many :wines
  has_many :regions
  has_many :varietals, through: :wines

  accepts_nested_attributes_for :wines

  validates :country_name, presence: true
  validates :country_name, uniqueness: true

  def self.country_search(search)
    self.where('country_name ILIKE ?', "%#{search}%")
  end
end
