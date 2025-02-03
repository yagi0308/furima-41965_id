class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller_or_sold, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller_or_sold
    return unless @item.user_id == current_user.id || @item.order.present?

    redirect_to root_path
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building,
                                          :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
