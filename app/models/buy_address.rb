class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :sender_id, :city, :street, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :sender_id, numericality: { other_than: 1, message: 'の項目を選択してください' }
    validates :city
    validates :street
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の半角数値で入力してください" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # 購入情報を保存し、変数buyに代入する
    buy = Buy.create(user_id: user_id , item_id: item_id)
    # 住所を保存する
    # buy_idには、変数buyのidと指定する
    Address.create(post_code: post_code, sender_id: sender_id, city: city, street: street, building: building, telephone: telephone, buy_id: buy.id,)
  end
end