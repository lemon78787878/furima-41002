class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :check_if_sold, only: [:index, :create]
  before_action :check_owner, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :sender_id, :city, :street, :building, :telephone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def check_if_sold
    if @item.buy.present?
      redirect_to root_path, alert: 'この商品はすでに購入されています。'
    end
  end

  def check_owner
    if @item.user == current_user
      redirect_to root_path
    end
  end

end
