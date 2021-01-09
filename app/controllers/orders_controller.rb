class OrdersController < ApplicationController
  def index
    @order_address = OrderAdress.new
  end

  def create
  end
end
