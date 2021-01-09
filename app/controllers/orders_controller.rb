class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_parms)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_parms
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
