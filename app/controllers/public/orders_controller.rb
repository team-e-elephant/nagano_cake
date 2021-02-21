class Public::OrdersController < ApplicationController
<<<<<<< HEAD

  def new
     @order = Order.find(params[:id])
     @order_new =　Order.new
  end
  
  def create
   @order = Order.new (order_params)
   @order.save
  end
  

  #情報入力画面でボタンを押して情報をsessionに保存
  

  private
  def order_params
      params.require(:order).permit(:customer_id, :shipping_cost, :postal_code, :address, :name, :total_patment, :payment_method, :status)
=======
  def index
    @orders = Order.all
  end
  def show
    @order = order.find(params[:id])
    
>>>>>>> origin/fujikura
  end
end
