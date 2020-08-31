class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, 
                                 :item_status_id, :delivery_pay_id, 
                                 :delivery_area_id, :delivery_day_id, 
                                 :price, :image).merge(user_id: current_user.id)
  end
end
