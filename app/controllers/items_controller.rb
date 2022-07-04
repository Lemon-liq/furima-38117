class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name,:price, :text, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :number_id, :user).marge(:image)
  end
end
