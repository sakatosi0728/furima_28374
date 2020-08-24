class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)

    if @user.valid?
      @user.save  
      return redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:images, :name, :explanation, :category_id, :status_id, :shipping_charges_id, :shipping_region_id, :days_until_shipping_id, :price)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
