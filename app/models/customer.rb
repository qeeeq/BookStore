class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
	
	has_many :ratings
	has_many :orders
	has_many :credit_cards
	has_many :addresses
	
	def name
		"#{first_name} #{last_name}"
	end

	def current_order
		@current_order ||= orders.find_or_create_by(status: :in_progress)
	end
end