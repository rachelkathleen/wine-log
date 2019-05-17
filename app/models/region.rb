class Region < ApplicationRecord
  belongs_to :country
  validates :region_name, :country_id, presence: true
  validates :region_name, uniqueness: true
end
