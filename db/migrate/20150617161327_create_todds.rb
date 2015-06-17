class CreateTodds < ActiveRecord::Migration
  def change
    create_table :todds do |t|
    	t.integer :year
    	t.string  :name
    	t.integer :count 

      t.timestamps null: false
    end
  end
end
