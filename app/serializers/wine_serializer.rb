class WineSerializer < ActiveModel::Serializer
  attributes :id, :producer, :wine_name, :wine_type, :price_range, :vintage,
             :rating, :notes, :favorite
  belongs_to :user
  belongs_to :varietal
  belongs_to :country
  has_many :wine_aromas, serializer: WineAromaSerializer
  has_many :wine_tasting_terms, serializer: WineTastingTermSerializer
end
