class AddUserIdToTemplates < ActiveRecord::Migration[5.0]
  def change
  	add_column :templates, :user_id, :integer
  end
end
