class Property < ApplicationRecord
	has_many :template_properties 
	has_many :templates, through: :template_properties 
	
end
