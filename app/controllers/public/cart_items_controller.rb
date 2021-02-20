class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to items_path
  end

  private


end
