class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @review = @user.reviews
  end
end
