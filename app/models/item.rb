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

  with_options presence: true do
    validates :name, :explanation, :image
    validates :price, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 300 ,
      less_than_or_equal_to: 9999999
    }

    with_options numericality: {other_than: 0} do
      validates :category_id, :state_id, :shipping_fee_id,
        :prefecture_id, :scheduled_delivery_id
    end
  end

  def was_attached?
    self.image.attached?
  end
end

