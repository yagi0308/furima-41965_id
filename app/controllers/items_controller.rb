class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update]
  before_action :check_user, only: [:edit, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
    @item_categories = ItemCategory.all
    @item_status = ItemStatus.all
    @item_shipping_fees = ItemShippingFee.all
    @item_prefectures = ItemPrefecture.all
    @item_scheduled_delivery = ItemScheduledDelivery.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      redirect_to root_path
    else
      @item_categories = ItemCategory.all
      @item_status = ItemStatus.all
      @item_shipping_fees = ItemShippingFee.all
      @item_prefectures = ItemPrefecture.all
      @item_scheduled_delivery = ItemScheduledDelivery.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item_categories = ItemCategory.all
    @item_status = ItemStatus.all
    @item_shipping_fees = ItemShippingFee.all
    @item_prefectures = ItemPrefecture.all
    @item_scheduled_delivery = ItemScheduledDelivery.all
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      @item_categories = ItemCategory.all
      @item_status = ItemStatus.all
      @item_shipping_fees = ItemShippingFee.all
      @item_prefectures = ItemPrefecture.all
      @item_scheduled_delivery = ItemScheduledDelivery.all
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_status_id, :item_shipping_fee_id,
                                 :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to user_session_path unless @item.user == current_user
  end
end
