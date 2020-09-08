class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :item_set, only: [:edit, :update, :show, :destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save       #@item.valid?
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, 
                                 :item_status_id, :delivery_pay_id, 
                                 :delivery_area_id, :delivery_day_id, 
                                 :price, :image).merge(user_id: current_user.id)
  end
  
  def item_set
    @item = Item.find(params[:id])
  end
end
