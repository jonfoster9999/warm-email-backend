class Template < ApplicationRecord
	has_many :user_templates
	has_many :users, through: :user_templates, required: false
	has_many :template_properties 
	has_many :properties, through: :template_properties
end
