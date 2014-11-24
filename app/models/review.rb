class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates :comment, length: {minimum: 3}
	validates :comment, length: {maximum: 500}
end
