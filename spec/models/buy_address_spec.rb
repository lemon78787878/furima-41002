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
  end
end
