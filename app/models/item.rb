class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  # validates :price, presence: true, greater_than: 300, less_than: 9999999
end
