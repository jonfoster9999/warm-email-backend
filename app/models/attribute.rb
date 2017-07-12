class Attribute < ApplicationRecord
	has_many :template_attributes 
	has_many :templates, through: :attributes
end
