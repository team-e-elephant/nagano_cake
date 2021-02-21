class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:cart_item][:item_id])
    cart_item = current_customer.cart_items.new(cart_item_params)
    # @cart_item = current_cart_item.cart_items.find_by(item_id: params[:item_id])
    # if @cart_item.blank?
    #   @cart_item = current_cart_item.cart_items.build(item_id: params[:item_id])
    # end
    cart_item.save
    redirect_to cart_items_path
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
    @cart_item = CartItem.find(params[:id])
    # cart_item = @cart_item.cart_item.find_by(item_id)
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
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
