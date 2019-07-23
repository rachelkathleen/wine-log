class WineAromaSerializer < ActiveModel::Serializer
  attributes :id, :aroma_name
  has_many :wines, serializer: WineSerializer
end
