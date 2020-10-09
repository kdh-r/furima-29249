class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy, only: [:index, :create]



  def index
    @buy = BuyAddress.new
    return redirect_to root_path if @item.user_id == current_user.id || @item.buy # 後置ifを使用
  end

  def create
    @buy = BuyAddress.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.permit(:token, :postal_code, :prefecture_id, :city,
                  :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end


  def set_buy
    @item = Item.find(params[:item_id])
  end

  # Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]


  # 決済処理
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
