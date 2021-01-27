class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, except: [:new, :show]
  before_action :set_review, only: [:edit, :destroy]
  before_action :judge_user, only: [:edit, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = @item.reviews.new(review_params)
    if @review.save
      flash[:success] = '投稿が完了しました'
      redirect_to item_show
    else
      render action: 'new'
    end
  end

  def show
    @user = User.find(current_user.id)
    @reviews = @user.reviews
  end

  def edit
  end

  def update
    @review = @item.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:success] = '編集が完了しました'
      redirect_to item_show
    else
      render action: 'edit'
    end
  end

  def destroy
    if @review.destroy
      flash[:error] = 'レビューを削除しました'
      redirect_to item_show
    else
      render item_show
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def judge_user
    if @review.user_id != current_user.id
      flash[:error] = '権限がありません'
      redirect_to item_show
    end
  end

  def review_params
    params.require(:review).permit(:recommend_score, :taste, :scent, :otsumami, :comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_show
    item_path(@review.item_id)
  end
end
