class ItemsController < ApplicationController
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end



  private
  def item_params
     params.require(:item).permit(:name, :text, :category_id, :status_id, :postage_type_id, :ship_from_id, :delivery_time_id, :price )
  end


end
