class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item , only: [:new,:create]
  before_action :validate_user_and_purchase

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def validate_user_and_purchase
    unless current_user.id != @item.user_id && @item.purchase.nil?
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:purchase_address).permit(
      :postal_code, :prefecture_id, :city, :house_num,
      :building, :tel_num
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:    @item.price,
      card:      purchase_params[:token],
      currency:  'jpy'
    )
  end
end
