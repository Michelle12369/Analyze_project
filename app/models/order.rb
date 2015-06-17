class Order < ActiveRecord::Base
	self.table_name = "a05b00_order"

  def self.order_analysis3
    query = <<-SQL
	select Product_Type,count(Order_No) as product_count 
	from (select * from a05b00_order limit 50000) as product 
	where Tx_Type="網路"   
	inner join a05b00_order  as productyo 
	on product.Order_No =productyo.Order_No group by product.Product_Type;
 	
 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Product_Type.strip,count:d.product_count }}
  end

def self.search3(time)
    query = <<-SQL
	select productyo.Product_Type,count(productyo.Order_No) as product_count 
	from (select * from a05b00_order where Input_Date like "#{time}%" 
		and Tx_Type="網路" and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1) as product 
	inner join a05b00_order  as productyo 
	on product.Order_No =productyo.Order_No group by product.Product_Type;

	

 		SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Product_Type.strip,count:d.product_count }}
  end
  
end

#select productyo.Product_Type,count(productyo.Order_No) as product_count from (select * from a05b00_order where Input_Date like "2012-12%" and Tx_Type="網路" and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1) as product inner join a05b00_order  as productyo on product.Order_No =productyo.Order_No group by product.Product_Type;
#and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1