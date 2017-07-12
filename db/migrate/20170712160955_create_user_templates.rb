class CreateUserTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :user_templates do |t|
      t.integer :user_id 
      t.integer :template_id 
      t.timestamps
    end
  end
end
