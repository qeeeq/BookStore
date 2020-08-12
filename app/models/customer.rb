class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :authentication_keys => [:first_name, :last_name, :email]


  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
	
	has_many :ratings
	has_many :orders
	has_many :credit_cards
	has_many :addresses
	
	def name
		"#{first_name} #{last_name}"
	end

end
