class AddManualFollowUpToSentEmail < ActiveRecord::Migration[5.0]
  def change
    add_column :sent_emails, :manual_follow_up, :boolean, :default => false
  end
end
