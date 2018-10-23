class SentEmailSerializer < ActiveModel::Serializer
  attributes :id, :email, :email_type, :created_at, :manual_follow_up
end
