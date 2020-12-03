class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_index

  def index
    @order = OrderAddress.new
  end

  def create
    @user = User.find(current_user.id)
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save(@user, @item)
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_index
    return redirect_to root_path unless user_signed_in?

    root_path if current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
