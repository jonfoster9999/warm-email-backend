class Template < ApplicationRecord
	belongs_to :user, required: false
	has_many :template_properties 
	has_many :properties, through: :template_properties
end
