class PropertySerializer < ActiveModel::Serializer
  attributes :id, :name 
  has_many :templates 
end
