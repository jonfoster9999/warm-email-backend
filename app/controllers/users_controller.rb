class UsersController < ApplicationController
	def index 
		@users = User.find_each 
		render json: @users
	end

	def show 
		@user = User.find(params[:id])
		render json: @user
	end 
 
end
