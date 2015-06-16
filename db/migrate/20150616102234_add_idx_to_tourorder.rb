class AddIdxToTourorder < ActiveRecord::Migration
  def change
  	add_index :a05b01_tourorder,:Order_No
  end
end
