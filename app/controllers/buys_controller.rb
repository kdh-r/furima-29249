class BuysController < ApplicationController
  # before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = BuyAddress.new(buy_params)
    if @buy.valid?            
      pay_item 
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end

  end


 private

    def buy_params
      params.permit( :token, :postal_code, :prefecture_id, :city,
                     :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
    end
    
    #決済処理
    def pay_item
      Payjp.api_key = "sk_test_2f93eb7abef01424d342b232"
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency:'jpy'
      )
    end
end
