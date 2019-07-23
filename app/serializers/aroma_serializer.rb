class AromaSerializer < ActiveModel::Serializer
  attributes :id, :aroma
  has_many :wine_ids, serializer: WineSerializer
end
