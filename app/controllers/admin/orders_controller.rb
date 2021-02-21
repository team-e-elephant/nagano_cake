class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = Order_detail.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
  end
  
end
