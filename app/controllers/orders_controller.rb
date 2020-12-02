class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create] # only不要？
  # 多分セットも書くことになる。クレジット決済機能実装後に確認しよう
  # その場合はmove_to_indexの上に書き、move_to_index内の記述も消すこと

  def index
    @item = Item.find(params[:item_id])
    # params[その商品のid]
    # ① /items/2/orders の2の部分がrails routesで確認したURIでどのような名前になっているかを確認
    # ②その名前で商品詳細ビューファイルの item_orders_path(その名前：@item.id)
    @order = OrderAddress.new
  end

  def create
    @user = User.find(current_user.id)
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save(@user, @item)
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    # unless user_signed_in?
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end