class Public::OrdersController < ApplicationController

  def new
     @order_new = Order.new
     @addresses = current_customer.addresses
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end

  def create
   @order = Order.new (order_params)
   @order.save
  end

  def confirm
  end

  def complete
  end


  #情報入力画面でボタンを押して情報をsessionに保存


  private
  def order_params
      params.require(:order).permit(:customer_id, :shipping_cost, :postal_code, :address, :name, :total_patment, :payment_method, :status)
  end
end
