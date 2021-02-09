class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    Favorite.create(user_id: current_user.id, item_id: params[:id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, item_id: params[:id]).destroy
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end
end
