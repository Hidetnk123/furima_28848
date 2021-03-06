class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
  before_action :purchase_item, only: [:index, :create]
  before_action :item_index, only: [:index, :create]

  def index
    @purchase_history = PurchaseAddress.new
  end
  
  def create
    @purchase_history = PurchaseAddress.new(purchase_history_params)
    if @purchase_history.valid?
      pay_item
      @purchase_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_item
    @item = Item.find(params[:item_id])
  end

  def purchase_history_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :address, 
                                             :building, :token, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user.id == current_user.id
        redirect_to root_path
    end
  end

  def item_index
    if @item.purchase_history.present?
        redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    amount = @item.price
    Payjp::Charge.create(
      amount: amount,  # 商品情報
      card: purchase_history_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
 
end

