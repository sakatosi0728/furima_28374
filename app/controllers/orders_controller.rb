class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :move_to_index, only: [:index, :create]

  def index
    @buyer_info = Buyer.new

    if @item.order != nil
      redirect_to root_path
    end 
  end

  def create
    @buyer_info = Buyer.new(buyer_params)
    if @buyer_info.valid?
      pay_item
      @buyer_info.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :token, :price).merge(user_id: current_user.id, item_id: params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
