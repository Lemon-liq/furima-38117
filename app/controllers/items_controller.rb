class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :condition_id, :deliverycharge_id, :prefecture_id,
                                 :number_id, :user, :image).merge(user_id: current_user.id)
  end
end
