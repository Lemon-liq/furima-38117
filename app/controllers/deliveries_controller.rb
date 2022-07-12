class DeliveriesController < ApplicationController

  def index
    @buy_delivery = BuyDelivery.new
    @item = Item.find(params[:item_id])
  end

  def new
    @buy_delivery = BuyDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_8060cf840fcd8c3710b5cf1a"
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: delivery_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  
end
