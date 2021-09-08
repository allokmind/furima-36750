class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_params, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid? 
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_params
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_87b20638e72536ccfd6bbdc7" 
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_address_params[:token],    
      currency: 'jpy'                 
    )
  end

end
