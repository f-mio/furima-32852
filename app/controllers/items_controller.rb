class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :validate_item_status, only: [:edit, :destroy]

  def index
    query  = 'SELECT * FROM items ORDER BY created_at desc;'
    @items = Item.find_by_sql(query)
  end

  def search
    @items = SearchItemsService.search(params[:keyword])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    query = "SELECT * FROM comments WHERE item_id = #{params[:id]}"
    @comment  = Comment.new
    @comments = Comment.find_by_sql(query)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def validate_user
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def item_params
    params.require(:item).permit(:name, :price, :category_id,
                                 :explanation, :state_id, :shipping_fee_id,
                                 :prefecture_id, :scheduled_delivery_id, images: []).merge(user_id: current_user.id)
  end

  def validate_item_status
    redirect_to root_path if Item.find(params[:id]).purchase
  end
end
