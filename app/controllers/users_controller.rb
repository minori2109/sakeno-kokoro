class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    judge_user

  favorites = Favorites.where(user_id: current_user.id).pluck(:item_id)
  @favorite_list = Item.find(favorites)
  end

  private

  def judge_user
    if current_user != @user
      flash[:error] = '権限がありません'
      redirect_to root_path
    end
  end

end
