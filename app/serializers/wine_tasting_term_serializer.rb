class WineTastingTermSerializer < ActiveModel::Serializer
  attributes :id, :term, :definition
  has_many :wines, serializer: WineSerializer
end
