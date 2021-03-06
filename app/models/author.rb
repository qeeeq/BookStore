class Author < ApplicationRecord
	validates :firstname, presence: true, uniqueness: true
	validates :lastname, presence: true, uniqueness: true
	has_many :books

	def name
		"#{firstname} #{lastname}"
	end


end
