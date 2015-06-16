class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
    	t.integer :year
    	t.string  :name
    	t.string :count  
      t.timestamps null: false
    end
  end
end
