class HomeController < ApplicationController


	def index

  end

  def algo1

   colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
   @data=[]
   if params[:years].present?
    Group.search(params[:years]).each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
      @year=params[:years]

    end
  end
end

def algo2
  colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
  @data=[]
  if params[:years].present?
    Order.search3(params[:years]).each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
       @year=params[:years]
    end
  end
end
def algo3

  @click=[]
  Group.search(params[:years]).each_with_index do|d,idx|
    @click<<[d[:name],d[:count]]
  end
   @year=params[:years]
  @click0=@click[0][1]
  @click1=@click[1][1]
  @click3=@click[3][1]
  @click5=@click[5][1]
  @clicksum=@click0+@click1+@click3+@click5
  @click2=@click[2][1]
  @click4=@click[4][1]
  @order=[]
  Order.search3(params[:years]).each_with_index do|d,idx|
    @order<<[d[:name],d[:count]]
  end
  @order0=@order[0][1]
  @order1=@order[1][1]
 # @order2=@order[2][1]
  @ordergroup=@order[0][1]
  @proportion=(@ordergroup*100/@clicksum)
 # @orderticket=@order[1][1]
  @clickticket=@click[2][1]
 # @proportionticket=(@orderticket*100/@clickticket)
  @orderfree=@order[1][1]
  @clickfree=@click[4][1]
  @proportionfree=(@orderfree*100/@clickfree)      
end

def algo4
  colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
  @data=[]
  Agentno.customer_analysis4.each_with_index do|d,idx|
    @data<<[d[:name],d[:count]]
  end
end

def example
  @click=[]
  
  Group.search(params[:years]).each_with_index do|d,idx|
    @click<<[d[:name],d[:count]]
  end
   @year=params[:years]
  @click0=@click[0][1]
  @click1=@click[1][1]
  @click3=@click[3][1]
  @click5=@click[5][1]
  @clicksum=@click0+@click1+@click3+@click5
  @click2=@click[2][1]
  @click4=@click[4][1]
  @order=[]
  Order.search3(params[:years]).each_with_index do|d,idx|
    @order<<[d[:name],d[:count]]
  end
  @order0=@order[0][1]
  @order1=@order[1][1]
  @order2=@order[2][1]
  @ordergroup=@order[0][1]
  @proportion=(@ordergroup*100/@clicksum)
  @orderticket=@order[1][1]
  @clickticket=@click[2][1]
  @proportionticket=(@orderticket*100/@clickticket)
  @orderfree=@order[2][1]
  @clickfree=@click[4][1]
  @proportionfree=(@orderfree*100/@clickfree)

end

private 
def search_params
  params.require(:choose).permit(:collection)
end


end


