class UsersController < ApplicationController
	def index
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/events'
		else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
	    if user.update(user_params)
	    	flash[:success] = ["User successfully updated"]
	      	redirect_to user
	    else
	    	flash[:errors] = user.errors.full_messages
	      	redirect_to :back
	    end
	end






	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
		end
end
