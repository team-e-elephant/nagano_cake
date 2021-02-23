class Admin::HomesController < ApplicationController
  def top
    # byebug
    if params[:format].nil?
    @orders = Order.all
    else
    @orders = Order.where(id: params[:format])
    end
  end
end
