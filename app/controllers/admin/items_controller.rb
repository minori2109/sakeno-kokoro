class Admin::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :if_not_admin

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    render action: "new" unless @item.save
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = '編集が完了しました'
      redirect_to items_path
    else
      render action: "edit"
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def item_params
    params.require(:item).permit(:image, :name, :price, :info, :size, :alcohol_degree, :category_id, :rice_id, :storage_method_id, :kuramoto_id, :prefecture_id, :delivery_method)
  end
end
