require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、rb_last_name、rb_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end


    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end


      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid? 
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save #まずは1人目の入力内容の保存
        another_user = FactoryBot.build(:user) #2人目の作成を開始
        another_user.email = @user.email #2人目のEmailを1人目と同じにする
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end


      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end


      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが英字では登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角文字を使用してください")
      end


      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが英字では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角文字を使用してください")
      end


      it 'rb_last_nameが空では登録できない' do
        @user.rb_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb last name can't be blank")
      end
      it 'rb_last_nameが漢字では登録できない' do
        @user.rb_last_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb last name はカタカナで入力してください")
      end
      it 'rb_last_nameがひらがなでは登録できない' do
        @user.rb_last_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb last name はカタカナで入力してください")
      end
      it 'rb_last_nameが英字では登録できない' do
        @user.rb_last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb last name はカタカナで入力してください")
      end


      it 'rb_first_nameが空では登録できない' do
        @user.rb_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb first name can't be blank")
      end
      it 'rb_first_nameが漢字では登録できない' do
        @user.rb_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb first name はカタカナで入力してください")
      end
      it 'rb_first_nameがひらがなでは登録できない' do
        @user.rb_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb first name はカタカナで入力してください")
      end
      it 'rb_first_nameが英字では登録できない' do
        @user.rb_first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rb first name はカタカナで入力してください")
      end


      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'birthdayの西暦が空では登録できない' do
        @user.birthday = '-01-01'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'birthdayの月が空では登録できない' do
        @user.birthday = '1990--01'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'birthdayの日付が空では登録できない' do
        @user.birthday = '1990-01-'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
