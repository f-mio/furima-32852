class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :building, :tel_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, :city, :house_num, :tel_num, :token
    with_options numericality: {other_than: 0} do
      validates :prefecture_id
    end
  end

  def save
    purchase = Purchase.create(
      user_id: user_id, item_id: item_id)
    Address.create(
      purchase_id: purchase.id, postal_code: postal_code,
      prefecture_id: prefecture_id, city: city,
      house_num: house_num, building: building,
      tel_num: tel_num)
  end
end