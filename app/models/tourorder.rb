class Order < ActiveRecord::Base
	self.table_name = "a05b01_tourorder"

	def self.search3(time)
    query = <<-SQL
	select Touryo.Tour_Type,count(product.Order_No) as product_count 
	from (select * from a05b01_tourorder where Input_Date like "2012%" 
		and Tx_Type="網路" and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1) as product 
	inner join a03a3_group  as Touryo 
	on product.Order_No =Touryo.Order_No group by product.Tour_Type;


select Tour_Type ,count(a03a3_group.Tour_Type) as count
from a05b01_tourorder,a05b00_order,a03a3_group 
where Input_Date like "2012%" and Tx_Type="網路" and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1 
and a05b01_tourorder.Order_No=a05b00_order.Order_No and
a05b01_tourorder.Tour_Code=a03a3_group.Tour_Code group by Tour_Type;

Input_Date like "2012%" and Tx_Type="網路" 
and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1 
and