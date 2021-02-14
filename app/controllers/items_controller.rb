class ItemsController < ApplicationController
  def index
  end

  def item_params
    params.require(:item).permit(:name, :price,:category_id,
      :explanation,:state_id, :shipping_fee_id,
      :item_prefecture_id, :scheduled_delivery_id,
      :image
    ).merge(user_id: current_user.id)
  end
end
