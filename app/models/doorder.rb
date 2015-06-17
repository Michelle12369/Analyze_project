class Doorder < ActiveRecord::Base
def self.doorder(time)
		query = <<-SQL
		select name,count as count
		from doorders
		where year like "#{time}%";

		
 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
 	data.map{|d| {name:d.name.strip,count:d.count.to_i }}
  end
end

