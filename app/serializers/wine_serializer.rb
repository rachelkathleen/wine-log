class WineSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :producer, :wine_name, :wine_type, :price_range, :vintage,
             :rating, :notes, :favorite, :picture
  belongs_to :user
  belongs_to :varietal
  belongs_to :country
  has_many :wine_aromas, serializer: AromaSerializer
  has_many :wine_tasting_terms, serializer: TastingTermSerializer

  def picture
    rails_blob_path(object.picture, disposition: "attachment", only_path: true) if object.picture.attached?
  end
end
