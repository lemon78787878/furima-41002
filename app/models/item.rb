class Item < ApplicationRecord

  with_options presence: true do
    validates :item
    validates :description
    validates :category_id
    validates :condition_id
    validates :post_cost_id
    validates :sender_id
    validates :ship_date_id
    validates :price
  end


  belongs_to :user
  has_one_attached :image

end
