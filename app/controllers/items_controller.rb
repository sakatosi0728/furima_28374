class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  private

end
