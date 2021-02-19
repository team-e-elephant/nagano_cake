class Admin::ItemsController < ApplicationController
    
    def index
        @items = Item.page(params[:page]).per(10) 
    end
    
    def show
        @items = Item.page(params[:id])
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
    end

        
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
    end
    
private
  
    def item_params
        params.require(:item).permit(:genre_id,:name,:image,:introduction,:price,:is_active)
    end
end

