class Admin::ItemsController < ApplicationController
    def index
    end
    
    def show
    end
    
    def new
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
private
  
    def item_params
        params.require(:item).permit(:)
    end
end
