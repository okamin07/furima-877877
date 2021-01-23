class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :details, :prcie ,:shiping_address_id)
  end
end
