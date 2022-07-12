class BuyDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address_line1, :address_line2, :tel, :buy_id, :token

  validates :zip_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address_line1, presence: true
  validates :tel, presence: true

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address_line1: address_line1, address_line2: address_line2, tel: tel, buy_id: buy.id)
  end
end