require 'spec_helper'
require 'rails_helper'

describe User do
	let!(:user) { create(:user) }

	# # Question 1
	# it "can be created with a password and confirmation"

	# end

	# # Question 2
	# it "must have a password and confirmation on create"

	# end

	# # Question 3
	# it "must have its confirmation match a password"

	# end

	# # Question 4
	# it "must have a unique email"

	# end

	# # Question 5
	# it "can have many reviews"
	it "can have many reviews" do
		3.times do
			user.reviews << create(:review)
		end

		expect(user.reviews.count).to equal(3)
	end

	# end

	# # Question 6
	# it "can list products it has reviewed without duplicates"

	# end

	# Question 7
	it "must have a name" do

		user.name = ""
		expect(user).to_not be_valid
	end
end