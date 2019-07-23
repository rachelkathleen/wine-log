class TastingTermSerializer < ActiveModel::Serializer
  attributes :id, :tasting_term
  has_many :wines, serializer: WineSerializer
end
