class TastingTerm < ApplicationRecord
  has_many :wine_tasting_terms
  has_many :wines, through: :wine_tasting_terms

  validates :term, :definition, presence: true
  validates :term, uniqueness: true

  def self.glossary_search(search)
    self.where('term ILIKE :search or definition ILIKE :search', search: "%#{search}%")
  end
end
