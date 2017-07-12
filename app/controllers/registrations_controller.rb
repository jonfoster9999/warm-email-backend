class RegistrationsController < ApplicationController
	def new 
		@user = User.new(:email => params["email"],
						 :password => params["password1"]
						 )
		@user.templates << Template.first.dup
		if @user.save 
			render json: @user
		else 
			render plain: "failure"
		end
	end

	def login 
		@user = User.find_by(:email => params[:email])
		if @user && @user.authenticate(params[:password])
			render json: @user 
		else 
			render plain: "failure"
		end
	end
end
