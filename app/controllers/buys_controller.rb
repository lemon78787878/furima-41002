class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :sender_id, :city, :street, :building, :telephone).merge(user_id: current_user.id, item_id: @item.id)
  end

end
