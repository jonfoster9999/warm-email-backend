class AddTimestampsToSentEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :sent_emails, :created_at, :datetime
    add_column :sent_emails, :updated_at, :datetime
  end
end
