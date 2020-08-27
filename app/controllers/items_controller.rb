class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @items = Item.all.order(id: "DESC")
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


  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :item_status_id, :delivery_pay_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end


end
