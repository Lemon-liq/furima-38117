class Delivery < ApplicationRecord
  belongs_to :buy

  validates :zip_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address_line1, presence: true
  validates :tel, presence: true
end
