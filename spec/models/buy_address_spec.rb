require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
  end

  context '内容に問題ない場合' do
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@buy_address).to be_valid
    end
    it 'buildingの入力がなくても保存できること' do
      @buy_address.building = ''
      expect(@buy_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空では保存できないこと' do
      @buy_address.post_code = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeに「-」がなければ保存できないこと' do
      @buy_address.post_code = '1111111'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'post_codeは、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @buy_address.post_code = '1111-111'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end


    it 'sender_idがid: 1では保存できないこと' do
      @buy_address.sender_id = '1'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Sender の項目を選択してください")
    end

    it 'cityが空では保存できないこと' do
      @buy_address.city = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("City can't be blank")
    end

    it 'streetが空では保存できないこと' do
      @buy_address.street = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Street can't be blank")
    end

    it 'telephoneが空では保存できないこと' do
      @buy_address.telephone = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone can't be blank")
    end
    it 'telephoneは、9桁以下では登録できないこと' do
      @buy_address.telephone = '999999999'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone は10桁または11桁の半角数値で入力してください")
    end
    it 'telephoneは、12桁以上では登録できないこと' do
      @buy_address.telephone = '111111111111'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone は10桁または11桁の半角数値で入力してください")
    end
    it 'telephoneは、半角数字以外が含まれている場合、登録できないこと' do
      @buy_address.telephone = '111-111-1111'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone は10桁または11桁の半角数値で入力してください")
    end

    it "tokenが空では登録できないこと" do
      @buy_address.token = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end


    it "user_idが空だと登録できない" do
      @buy_address.user_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空だと登録できない" do
      @buy_address.item_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end

#実施： bundle exec rspec spec/models/buy_address_spec.rb

