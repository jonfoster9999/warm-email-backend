class TempateAttribute < ApplicationRecord
	belongs_to :template 
	belongs_to :attribute
end
