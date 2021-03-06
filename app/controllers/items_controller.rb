class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_item,            only: [:edit, :show, :update, :destroy]
  before_action :set_orders,          only: [:index, :show, :edit, :destroy]
  before_action :move_to_index,       only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :item_condition_id,
                                 :delivery_fee_burden_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id

    root_path if @orders.include?(@item.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_orders
    @orders = Order.pluck(:item_id)
  end
end
