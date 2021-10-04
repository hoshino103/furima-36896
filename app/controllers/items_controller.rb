class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      # @item = Item.find(params[:id])

      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_text, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :send_day_id, :price).merge(user_id: current_user.id)
  end
end
