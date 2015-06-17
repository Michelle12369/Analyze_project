class Click < ActiveRecord::Base
	def self.click(time)
		query = <<-SQL
		select name,count as count
		from clicks
		where year like "#{time}%";


 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
 	data.map{|d| {name:d.name.strip,count:d.count}}
  end
end
