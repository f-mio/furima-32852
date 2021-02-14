class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
#    binding.pry
    @user = Item.new(item_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id,
      :explanation, :state_id, :shipping_fee_id,
      :prefecture_id, :scheduled_delivery_id,
      :image
    ).merge(user_id: current_user.id)
  end
end
