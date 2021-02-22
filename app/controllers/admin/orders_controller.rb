class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = current_customer.order_detail
  end

  def update
    @order = Order.find(params[:id])
  end

end
