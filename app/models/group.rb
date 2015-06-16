class Group < ActiveRecord::Base
	self.table_name = "a03a3_group"


def self.click_analysis2
    query = <<-SQL
	select tour.Tour_Type ,count(tourclick.Tour_Code) as tour_count
	from (select * from b01a2_groupclick limit 50000)  as tourclick 
	inner join a03a3_group as tour
	on tourclick.Tour_Code=tour.Tour_Code group by tour.Tour_Type;
 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Tour_Type.strip,count:d.tour_count }}
  end

  def self.search(time)
    query = <<-SQL
	select tour.Tour_Type,count(tourclick.Activity_Seq) as tour_count
	from (select * from b01a2_groupclick where Usage_time like "#{time}%")  as tourclick 
	inner join a03a3_group as tour
	on tourclick.Tour_Code=tour.Tour_Code
	group by tour.Tour_Type;

	

 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Tour_Type.strip,count:d.tour_count }}
  end

end

