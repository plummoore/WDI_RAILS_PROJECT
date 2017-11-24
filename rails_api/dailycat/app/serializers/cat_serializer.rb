class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :giphy_image
  has_one :category
end
