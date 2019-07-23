class VarietalSerializer < ActiveModel::Serializer
  attributes :id, :varietal_name
  has_many :wines
end
