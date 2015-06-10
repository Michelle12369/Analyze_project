class AddIdxToGroup < ActiveRecord::Migration
  def change
  	add_index :a03a3_group,:Tour_Code
  end
end
