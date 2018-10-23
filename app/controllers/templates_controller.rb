class TemplatesController < ApplicationController
	def index
    @user = User.find(params[:user_id])
		@templates = @user.templates
		render json: @templates
	end

	def send_emails
		size = params["emails"].size
		response = { :status => 200, :errors => [], :successes => [], :total_attempts => size, :sent_email_addresses => [] }
		params["emails"].each do |email|
			begin
				WcMailer.multiple_emails(email).deliver
			rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
				response[:errors] << email["emailIndex"]
			else
				response[:successes] << email["emailIndex"]
				response[:sent_email_addresses] << { email: email["email"], email_type: email["email_type"] }
			end
		end

		render json: response
	end

	def get_emails
		my_obj = {
			:emails => [
				{:email => "snowdaymail@yahoo.com", :subject => "cool subject", :body => "here is a cool body <a href='google.com'>Google</a>"},
				{:email => "redcabinmusic@yahoo.com", :subject => "cool subject", :body => "here is a cool body"}
			]
		}
		my_obj[:emails].each do |email|
			WcMailer.multiple_emails(email).deliver
		end
		render plain: "Good Job!"

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
