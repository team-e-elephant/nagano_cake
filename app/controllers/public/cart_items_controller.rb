class Public::CartItemsController < ApplicationController

  before_action :setup_cart_item, only: [:create, :update, :destroy]

  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def create
    if @cart_item.blank?
      @cart_item = current_cart_items.build(item_id: params[:item_id])
    end
    @cart_item.quantity += params[:amount].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_cart.items
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart_items
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to items_path
  end

  private

  def setup_cart_item
    @cart_item = current_cart_items.find_by(item_id: params[:item_id])
  end

end
