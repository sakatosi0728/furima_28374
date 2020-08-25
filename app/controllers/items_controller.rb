class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new 
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charges_id, :shipping_region_id, :days_until_shipping_id, :price)
  end

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
