FactoryGirl.define do
	factory :review do
		comment "This product sucks"
		product_id 4
		user_id 100
	end
end

