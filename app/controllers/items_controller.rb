class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_text, :category_id, :status_id, :shipping_charge_id, :prefecture_id,
                                 :send_day_id, :price).merge(user_id: current_user.id)
  end
end
