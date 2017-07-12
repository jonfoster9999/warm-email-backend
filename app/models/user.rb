class User < ApplicationRecord
	has_secure_password
	has_many :user_templates
	has_many :templates, through: :user_templates
	validates :email, presence: true
	validates :email, uniqueness: true
end
