class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    #@reviews = @review.item.includes(:user)
  end
end
