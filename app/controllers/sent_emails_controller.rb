class SentEmailsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    params[:email].each do |email|
      @sent_email = SentEmail.new
      @sent_email.email = email["email"]
      @sent_email.email_type = email["email_type"]
      @sent_email.user = @user
      @sent_email.save
    end

    render json: { msg: 'OK'}
  end

  def index
    @user = User.find(params[:user_id])
    render json: @user.sent_emails
  end
end
