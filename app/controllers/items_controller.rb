class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(imte_params)
  end

  private

  def imte_params
    params.require(:item).permit(:image, :name, :item_text, :category_id, :status_id, :shippingCharge_id, :prefecture_id, :sendDay_id, :price).merge(user_id: current_user.id)
  end

end
