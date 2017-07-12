class TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :body 
  has_many :properties
end
