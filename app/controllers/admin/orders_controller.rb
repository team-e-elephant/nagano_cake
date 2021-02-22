class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = current_customer.order_detail
  end

  def update
    @order = Order.find(params[:id])
    @order = Order.update
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end

end
