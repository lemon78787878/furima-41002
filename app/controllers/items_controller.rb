class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:item, :description, :category_id, :condition_id, :post_cost_id, :sender_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

end
