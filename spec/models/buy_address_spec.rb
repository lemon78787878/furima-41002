require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address)
  end

  context '内容に問題ない場合' do
    it '全ての値が正しく入力されていれば保存できること' do
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

    it 'sender_idが空では保存できないこと' do
      @buy_address.sender_id = nil
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
  end
end

#実施： bundle exec rspec spec/models/buy_address_spec.rb

