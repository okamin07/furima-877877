class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :details, :prcie ,:shiping_address_id,:category_id,:status_id,:delivery_fee_id,:shiping_address_id,:shiping_date_id).merge(user_id: 1)
  end
end
