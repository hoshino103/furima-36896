class PurchaseHistoriesController < ApplicationController
  def index
    @bought_address = BoughtAddress.new
  end

  def create
    @bought_address = BoughtAddress.new(bought_address_params)
    if @bought_address.valid?
      @bought_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def bought_address_params
    params.require(:bought_address).permit(:post_num, :prefecture_id, :municipalities, :street_number, :bought_address, :phone_num).merge(user_id: current_user.id)
  end


end
