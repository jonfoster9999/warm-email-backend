class User < ApplicationRecord
	has_secure_password
	has_many :templates
	validates :email, presence: true
	validates :email, uniqueness: true
end
