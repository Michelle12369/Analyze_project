class Od < ActiveRecord::Base
def self.od(time)
		query = <<-SQL
		select name,count as count
		from ods
		where year like "#{time}%";

		
 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
 	data.map{|d| {name:d.name.strip,count:d.count.to_i }}
  end
end

