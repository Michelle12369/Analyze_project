class Activity < ActiveRecord::Base
  self.table_name = "b01a2_activity"

  def self.data_count
    query = <<-SQL
    select service.Service_Name,count(activity.Service_id) as activity_count 
    from(select * from b01a2_activity limit 10000) as activity
    inner join b01a2_service  as service 
    on activity.Service_id =service.Service_id group by activity.Service_id;
    SQL

    data=Activity.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Service_Name.strip,count:d.activity_count}}
  end

  def self.data_count2
    query = <<-SQL
    select service.Service_Name,count(activity.Service_id) as activity_count from
    (select * from b01a2_activity limit 50000) as activity
    inner join b01a2_service  as service 
    on activity.Service_id =service.Service_id group by SUBSTRING(activity.Service_Id,1,7);
    SQL

    data=self.find_by_sql(query)
    data.map{|d| {name:d.Service_Name.strip.split('－')[0],count:d.activity_count}}
  end
 
	def self.data_count3
    query = <<-SQL
	select productyo.Product_Type,count(productyo.Order_No) as product_count ,activity_time
	from (select * from a05b00_order limit 5000) as product   
	inner join a05b00_order  as productyo 
	on product.Order_No =productyo.Order_No group by product.Product_Type;
 	
 		SQL
 	data=Order.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Product_Type.strip,count:d.product_count}}
  end

  
end