require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '商品出品情報が保存できる場合' do
      it '全てのフォームに正しく入力されていれば、商品出品情報が保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報が保存できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'itemが空では保存できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      
      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category の項目を選択してください")
      end

      it 'condition_idが空では保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが1では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition の項目を選択してください")
      end

      it 'post_cost_idが空では保存できない' do
        @item.post_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Post cost can't be blank")
      end
      it 'post_cost_idが1では保存できない' do
        @item.post_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Post cost の項目を選択してください")
      end

      it 'sender_idが空では保存できない' do
        @item.sender_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it 'sender_idが1では保存できない' do
        @item.sender_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender の項目を選択してください")
      end

      it 'ship_date_idが空では保存できない' do
        @item.ship_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date の項目を選択してください")
      end
      it 'ship_date_idが1では保存できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date の項目を選択してください")
      end

      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数値ではない場合保存できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが文字列では保存できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end



      it 'ユーザーが紐付いていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
