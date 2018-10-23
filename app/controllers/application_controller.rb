class ApplicationController < ActionController::API

  def add_manual_follow_up
    emails = SentEmail.where(:email => params[:email])
    emails.each do |email|
      email.manual_follow_up = true
      email.save
    end
    msg = 'no records found'
    updated = false

    if emails.length > 0
      msg = "#{emails.length} sent emails were updated"
      updated = true
    end

    emails = SentEmail.where(:manual_follow_up => true)
      .collect {|email| email.email }.uniq

    render json: { msg: msg, updated: updated, emails: emails}
  end

  def add_manual_follow_up_domain
    emails = SentEmail.where("email LIKE ?", "%" + params[:email] + "%")
    emails.each do |email|
      email.manual_follow_up = true
      email.save
    end
    msg = 'no records found'
    updated = false

    if emails.length > 0
      msg = "#{emails.length} sent emails were updated"
      updated = true
    end

    emails = SentEmail.where(:manual_follow_up => true)
      .collect {|email| email.email }.uniq

    render json: { msg: msg, updated: updated, emails: emails}
  end

  def manual_follow_ups
    emails = SentEmail.where(:manual_follow_up => true)
      .collect {|email| email.email }.uniq
    render json: {emails: emails}
  end

  def remove_manual_follow_up
    emails = SentEmail.where(:email => params[:email])
    emails.each do |email|
      email.manual_follow_up = false
      email.save
    end

    emails = SentEmail.where(:manual_follow_up => true)
      .collect {|email| email.email }.uniq
    render json: {emails: emails}
  end
end
