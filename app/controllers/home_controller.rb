class HomeController < ApplicationController


	def index
   render :layout=>"special"
 end

 def algo1

   colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
   @data=[]
   if params[:years].present?
   # Group.search(params[:years]).each_with_index do|d,idx|
   Click.click(params[:years]).each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
      @year=params[:years]

    end
  end
end

def algo2
  colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
  @data=[]
  @datasmall=[]
  if params[:years].present?
    #Order.search3(params[:years]).each_with_index do|d,idx|
    Od.od(params[:years]).each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
      @year=params[:years]
    end
    Todd.todd(params[:years]).each_with_index do|d,idx|
      @datasmall<<[d[:name],d[:count]]
      @year=params[:years]
    end
  end
end

def algo3
  @datasmall=[]
  @click=[]
  @order=[]
  if params[:years].present?
    
    #Order.search3(params[:years]).each_with_index do|d,idx|
    Od.od(params[:years]).each_with_index do|d,idx|
      @order<<[d[:name],d[:count]]
    end
    #Fight.fight(params[:years]).each_with_index do|d,idx|
    # Tourorder.searchtest(params[:years]).each_with_index do|d,idx|
      Todd.todd(params[:years]).each_with_index do|d,idx|
      @datasmall<<[d[:name],d[:count]]
      @year=params[:years]
    end
    Group.search(params[:years]).each_with_index do|d,idx|
    #Click.click(params[:years]).each_with_index do|d,idx|
      @click<<[d[:name],d[:count]]

    end
    @year=params[:years]
    @click0=@click[0][1]
    @click1=@click[1][1]
    @click3=@click[3][1]
    @click5=@click[5][1]
    @click4=@click[4][1]
    @click2=@click[2][1]
    @clicksum=@click0+@click2+@click3+@click4
    
    

    @datasmall0=@datasmall[0][1]
    @datasmall1=@datasmall[1][1]
    @datasmall2=@datasmall[2][1]
    @datasmall3=@datasmall[3][1]
    @datasmall4=@datasmall[4][1]

     # @order2=@order[2][1]
     @ordergroup=@order[0][1]
     @orderfree=@order[1][1]
     
     # @orderticket=@order[1][1]
     
     # @proportionticket=(@orderticket*100/@clickticket)
     
     @pgroup=((((@ordergroup.to_f)*100/@clicksum)*100).round.to_f)/100
     @pfree=((((@orderfree.to_f)*100/@click1)*100).round.to_f)/100

     @p0=((((@datasmall0.to_f)*100/@click0)*100).round.to_f)/100
     @p1=((((@datasmall2.to_f)*100/@click2)*100).round.to_f)/100
     @p2=((((@datasmall3.to_f)*100/@click3)*100).round.to_f)/100
     @p3=((((@datasmall4.to_f)*100/@click4)*100).round.to_f)/100
#((((@datasmall0.to_f)*100/@click0)*100).round.to_f)/100
   end
 end

 def algo4
  colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
  @data=[]
  Agentno.customer_analysis4.each_with_index do|d,idx|
    @data<<[d[:name],d[:count]]
  end
end

def example
  
 

  
end



end


