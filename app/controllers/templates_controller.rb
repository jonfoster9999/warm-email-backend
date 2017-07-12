class TemplatesController < ApplicationController
	def index 
        @user = User.find(params[:user_id])
		@templates = @user.templates
		render json: @templates
	end 

	def show
		@template = Template.find(params[:id])  
		render json: @template 
    end 

    def create 
        @user = User.find(params[:user_id])
    	@template = Template.new 
    	@template.name = params["name"]
    	@template.body = params["body"]
    	params["properties"].each do |property|
    		@template.properties.build(:name => property["name"])
    	end
        @user.templates << @template 
        @user.save

    end

    def update 
    	@template = Template.find(params[:id]) 
    	@template.name = params["name"]
    	@template.body = params["body"]
        @template.properties.clear
    	params["properties"].each do |property|
    		@template.properties.find_or_create_by(:name => property["name"])
    	end
    	@template.save 
    end 

    def destroy 
        @template = Template.find(params[:id])
        @template.destroy 
    end 
end
