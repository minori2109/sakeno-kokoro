class Admin::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_admin
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = '登録が完了しました'
      redirect_to items_path
    else
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = '編集が完了しました'
      redirect_to items_path
    else
      render action: 'edit'
    end
  end

  def destroy
    if @item.destroy
      flash[:error] = '商品を削除しました'
      redirect_to items_path
    else
      render action: 'show'
    end
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :price, :info, :size, :alcohol_degree, :category_id, :rice_id, :storage_method_id, :kuramoto_id, :prefecture_id, :delivery_method)
  end
end
