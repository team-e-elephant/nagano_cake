class Admin::ItemsController < ApplicationController
     
    #before_action :authenticate_admin! これ消すとページ飛べないので最後に消してください
    def index
        @items = Item.page(params[:page]).per(10) 
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def new
        @item = Item.new
        @genres = Genre.all
    end
    
    def create
        @item = Item.new(item_params)
        @genres = Genre.all
        if @item.save
            redirect_to admin_items_path
        else
            render :new
        end
    end

        
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
  	@item = Item.find(params[:id])
  	  if @item.update(item_params)
  	     redirect_to admin_item_path(@item)
  	  else
  		render :edit
  	  end
    end
        
      
    
private
  
    def item_params
        params.require(:item).permit(:genre_id,:name,:image,:introduction,:price,:is_active)
    end
end

