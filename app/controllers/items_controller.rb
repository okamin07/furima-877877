class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show]
  before_action :move_to_index, only: [:edit]


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

  def show 
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to controller: :items, action: :index
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :details, :price ,:shiping_address_id,:category_id,:status_id,:delivery_fee_id,:shiping_address_id,:shiping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    user = item.user
    unless user == current_user
      redirect_to action: :index
    end
  end
end
