class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
    	t.string :name 
    	t.text :body 
    	t.integer :user_id
    end
  end
end
