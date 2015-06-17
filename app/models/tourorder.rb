class Tourorder < ActiveRecord::Base
	self.table_name = "a05b01_tourorder"

	def self.searchtest(time)
    query = <<-SQL
	select Tour_Type ,count(a03a3_group.Tour_Type) as count
	from a05b00_order,a03a3_group,a05b01_tourorder
	where Input_Date like "#{time}%" and Tx_Type="網路" and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1 
	and a05b01_tourorder.Order_No=a05b00_order.Order_No and
	a05b01_tourorder.Tour_Code=a03a3_group.Tour_Code group by Tour_Type order by count desc;
	SQL
 	data=self.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| {name:d.Tour_Type.strip,count:d.count }}
  end
end

#select Tour_Type ,count(a03a3_group.Tour_Type) as count from a05b00_order,a03a3_group,a05b01_tourorder where Input_Date like "2012-12%" and Tx_Type="網路"  and a05b01_tourorder.Order_No=a05b00_order.Order_No and a05b01_tourorder.Tour_Code=a03a3_group.Tour_Code group by Tour_Type order by count desc;
	
#	select Tour_Type ,count(a03a3_group.Tour_Type) as count from a05b00_order,a03a3_group,a05b01_tourorder where Input_Date like "2013%" and Tx_Type="網路" and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1 and a05b01_tourorder.Order_No=a05b00_order.Order_No and a05b01_tourorder.Tour_Code=a03a3_group.Tour_Code group by Tour_Type order by count desc;

#select Tour_Type ,count(a03a3_group.Tour_Type) as count from a05b00_order,a03a3_group,a05b01_tourorder where Tx_Type="網路" and Internal_Mark=0 and Cancel_Mark=0 and Finish_Mark=-1 and a05b01_tourorder.Order_No=a05b00_order.Order_No and a05b01_tourorder.Tour_Code=a03a3_group.Tour_Code group by Tour_Type order by count desc;

#