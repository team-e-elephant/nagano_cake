class Public::AddressesController < ApplicationController

  def index
    # binding.pry
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    # binding.pry
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: "新しい配送先を登録しました"
    else
      @addresses = Address.all
      render 'index'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path, notice: "編集内容を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.permit(:postal_code, :address, :name)
  end

  # def ensure_correct_customer
  #   @address = Address.find(params[:id])
  #   unless @address.customer == current_costomer
  #     redirect_to addresses_path
  #   end
  # end

end
