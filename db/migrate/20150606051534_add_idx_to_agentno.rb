class AddIdxToAgentno < ActiveRecord::Migration
  def change
  	add_index :a04a1_agentno,:Agent_No
  end
end
