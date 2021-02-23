class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_details= @order.order_details
    @order_details.update
  end
end
