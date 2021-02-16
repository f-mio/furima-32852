class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300 ,
    less_than_or_equal_to: 9999999
  }
  validates :category_id,             presence: true, numericality: { other_than: 0 }
  validates :explanation,             presence: true
  validates :state_id,                presence: true, numericality: { other_than: 0 }
  validates :shipping_fee_id,         presence: true, numericality: { other_than: 0 }
  validates :prefecture_id,           presence: true, numericality: { other_than: 0 }
  validates :scheduled_delivery_id,   presence: true, numericality: { other_than: 0 }
  validates :image, presence: true

  def was_attached?
    self.image.attached?
  end
end

