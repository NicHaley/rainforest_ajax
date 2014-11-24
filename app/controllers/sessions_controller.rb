class SessionsController < ApplicationController
	def new
	end

	# Note: We don't have to instantiate a user object in our new action because 
	# we are only logging in, not creating a new user.

	def create
  	user = User.find_by_email(params[:email])	# Find user matching input email in db. Can't use .find(params[:email]) because .find only searches for ids
  	if user && user.authenticate(params[:password])  # If user exists and password correct
  		session[:user_id] = user.id				# Create a key/value pair
  		redirect_to products_path, notice: "Logged in!"		# Set up flash notice as a key/value pair
  	else
  		flash.now[:alert] = "Invalid email or password"		# Set up flash alert as a key/value pair
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil		# Set user sign in to nil (ie. no one is signed in)
  	redirect_to products_url, notice: "Logged out!"
  end
end
