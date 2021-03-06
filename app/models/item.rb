class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :deliverycharge_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :number_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deliverycharge
  belongs_to :prefecture
  belongs_to :number
end
