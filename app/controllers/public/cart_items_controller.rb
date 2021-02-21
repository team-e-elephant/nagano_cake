class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @cart_item = current_customer.cart_item.new(cart_item_params)
    @cart_item.item_id = @item.id
    @cart_item.save
  end

  def update
    @item = Item.find(params[:item_id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_item_path(@cart_item), notice: "You have updated book successfully."
    else
      render "index"
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    cart_item = @item.cart_item.find_by(item_id)
    cart_item.destroy
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to items_path
  end

  private
    def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end

end
