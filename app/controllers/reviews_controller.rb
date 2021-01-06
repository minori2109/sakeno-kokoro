class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      flash[:success] = '投稿が完了しました'
      redirect_to items_path
    else
      render action: 'new'
    end
  end

  private
  def review_params
    params.require(:review).permit(:recommend_score, :taste, :scent, :otsumami, :comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
