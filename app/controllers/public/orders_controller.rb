class Public::OrdersController < ApplicationController

  def new
     @order = Order.new
     @addresses = current_customer.addresses
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end

  def create
   @order = Order.new(order_params)
   @sum = params[:order][:sum]
   @order.customer_id = current_customer.id
   @cart_items = current_customer.cart_items
  # @order.name = address.name
   @order.shipping_cost = 800
   @order.total_payment = (800+@sum.to_i)
   @order.save
   redirect_to orders_complete_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:selected_address] == "0"
      @order.address = current_customer.address
    elsif params[:order][:selected_address] == "1"
      address=Address.find(params[:order][:customer_id])
      @order.address = address.address
      @order.name = address.name
      @order.postal_code = address.postal_code
    # binding.pry
    elsif params[:order][:selected_address] == "2"
    end
    # binding.pry
  end

  def complete
  end

  #情報入力画面でボタンを押して情報をsessionに保存


  private
  def order_params
      params.require(:order).permit(:customer_id, :shipping_cost, :postal_code, :address, :name, :total_patment, :payment_method, :status)
  end
end
