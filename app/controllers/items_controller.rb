class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :description, :category_id, :condition_id, :post_cost_id, :sender_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

end
