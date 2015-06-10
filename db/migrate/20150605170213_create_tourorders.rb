class CreateTourorders < ActiveRecord::Migration
  def change
    create_table :tourorders do |t|
    	t.timestamps null: false
    end
  end
end
