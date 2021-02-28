class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :building, :tel_num, :token, :user_id, :item_id

  with_options presence: true do
    validates :city, :house_num, :token, :user_id, :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :tel_num, format: { with: /\A\d{1,11}\z/.freeze, message: 'must be integer and less than or equal 11 digits.' }
    with_options numericality: { other_than: 0 } do
      validates :prefecture_id
    end
  end

  def save
    purchase = Purchase.create(
      user_id: user_id, item_id: item_id
    )
    Address.create(
      purchase_id: purchase.id, postal_code: postal_code,
      prefecture_id: prefecture_id, city: city,
      house_num: house_num, building: building,
      tel_num: tel_num
    )
  end
end
