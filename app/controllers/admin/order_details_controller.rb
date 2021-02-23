class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_details= @order.order_details
    # byebug
    @order_details.update(order_detail_params)
    redirect_back(fallback_location: root_path)
  end
  private
  def order_detail_params
   params.require(:order_detail).permit(:making_status)
  end
end
