class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if current_user != @user
      flash[:error] = '権限がありません'
      redirect_to root_path
    end
  end

end
