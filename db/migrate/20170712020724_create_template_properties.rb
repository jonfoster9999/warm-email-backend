class CreateTemplateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :template_properties do |t|
    	t.integer :template_id  
    	t.integer :property_id
    end
  end
end
