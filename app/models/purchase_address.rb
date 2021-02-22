class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :buiding, :tel_num

  with_options presence: true do
    validates :postal_code, :city, :address, :tel_num
    with_options numericality: {other_than: 0} do
      validates :prefecture_id
    end
  end

  private
  purchase_params.require(:purchase_address).permit(
    :purchase, :postal_code, :prefecture_id,
    :city, :address, :buiding, :tel_num
  ).merge(
    user_id: current_user.id, item_id: params[:id])
end