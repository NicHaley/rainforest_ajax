class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews
	has_many :products, through: :reviews

	validates :email, presence: true
	validates :name, presence: true
	validates :email, uniqueness: true
	validates :password, confirmation: true
end
