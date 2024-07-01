class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :post_cost
  belongs_to :sender
  belongs_to :ship_date

  with_options presence: true do
    validates :item
    validates :description
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: 'の項目を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :post_cost_id
    validates :sender_id
    validates :ship_date_id
  end

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }


  belongs_to :user
  has_one_attached :image

end
