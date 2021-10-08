class PurchaseHistoriesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :login_user

  def index
    @bought_address = BoughtAddress.new
  end

  def create
    @bought_address = BoughtAddress.new(bought_address_params)
    if @bought_address.valid?
      pay_item
      @bought_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def bought_address_params
    params.require(:bought_address).permit(:post_num, :prefecture_id, :municipalities, :street_number, :bought_address, :phone_num).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: bought_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def login_user
    redirect_to root_path if current_user.id == @item.user_id || PurchaseHistory.exists?(item_id: @item.id)
  end
end
