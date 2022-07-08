class DeliverysController < ApplicationController

  def index
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(order_params)
    # binding.pry
    if @delivery.valid?
      @delivery.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:zip_code, :prefecture_id, :city, :address_line1, :address_line2, :tel, :buy,)
  end

end
