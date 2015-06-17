class CreateOds < ActiveRecord::Migration
  def change
    create_table :ods do |t|
t.integer :year
    	t.string  :name
    	t.integer :count 
      t.timestamps null: false
    end
  end
end
