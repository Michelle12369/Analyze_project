class Agentno < ActiveRecord::Base
	self.table_name = "a04a1_agentno"
	
def self.customer_analysis4
    query = <<-SQL
	select agentno.Agent_Type,count(agentno.Agent_No) as agent_count 
	from (select * from a04a1_agentno limit 50000) as agent   
	inner join a04a1_agentno  as agentno
	on agent.Agent_No =agentno.Agent_No group by agent.Agent_Type;
 	
 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Agent_Type.strip,count:d.agent_count }}
  end

end