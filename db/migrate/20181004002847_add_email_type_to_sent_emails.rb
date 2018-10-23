class AddEmailTypeToSentEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :sent_emails, :email_type, :string
  end
end
