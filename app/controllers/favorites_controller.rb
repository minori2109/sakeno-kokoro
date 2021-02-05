class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    Favorite.create(user_id: current_user.id, item_id: @item.id)
    redirect_to item_path(@item.id)
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, item_id: @item.id).destroy
    redirect_to item_path(@item.id)
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
