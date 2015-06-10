class HomeController < ApplicationController
	def index
    colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
    @data=[]
    Activity.data_count2.each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
  end
    def algo2
    colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
    @data=[]
    Group.data_count2.each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
  	end

    def algo3
       colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
    @data=[]
    Order.data_count3.each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
    end

    def algo4
       colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
    @data=[]
    Agentno.data_count4.each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
    end
    def algo1
     @data=Group.data_count2.each_with_index do|d,idx|
     
      
      
    end
end
end
end
end
end
end