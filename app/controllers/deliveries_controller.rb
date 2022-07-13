class DeliveriesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @buy_delivery = BuyDelivery.new
  end

  def new
    @buy_delivery = BuyDelivery.new
  end

  def create   
    @buy_delivery = BuyDelivery.new(delivery_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def delivery_params
    params.require(:buy_delivery).permit(:zip_code, :prefecture_id, :city, :address_line1, :address_line2, :tel).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: delivery_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def move_to_index
    if @item.buy.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
