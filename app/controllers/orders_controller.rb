class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :judge_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      flash[:success] = '商品の購入が完了しました'
      redirect_to items_path
    else
      render action: 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def judge_item
    unless @item.order.nil?
      redirect_to items_path
      flash[:error] = '不正な操作です'
    end
  end
end
