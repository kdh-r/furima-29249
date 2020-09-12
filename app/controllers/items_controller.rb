class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end


  


  private
  
  def item_params
     params.require(:item).permit(:name, :image, :text, :category_id, :status_id, :postage_type_id, :ship_from_id, :delivery_time_id, :price ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index 
    end
  end
  


end
 