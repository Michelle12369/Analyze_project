class Order < ActiveRecord::Base
	self.table_name = "a05b00_order"

	def self.data_count3
    query = <<-SQL
	select productyo.Product_Type,count(productyo.Order_No) as product_count 
	from (select * from a05b00_order limit 50000) as product   
	inner join a05b00_order  as productyo 
	on product.Order_No =productyo.Order_No group by product.Product_Type;
 	
 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Product_Type.strip,count:d.product_count }}
  end
end