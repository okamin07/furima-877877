class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :details, :price ,:shiping_address_id,:category_id,:status_id,:delivery_fee_id,:shiping_address_id,:shiping_date_id).merge(user_id: current_user.id)
  end
end
