class CreateSentEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :sent_emails do |t|
      t.string :email
      t.integer :user_id
    end
  end
end
