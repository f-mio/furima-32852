require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end

    context "正しい情報を入力するとサインアップできる" do
      it '正しい情報を入力するとログインができる' do
        expect(@user).to be_valid
      end
    end

    context "新規登録／ユーザ情報" do
      it 'ニックネームが必須であること' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意であること' do
        @user_another = FactoryBot.build(:user)
        @user_another.email = @user.email
        @user_another.save
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = @user.email.gsub!(/@/, "")
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必須であること' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Password can't be blank",
          "Password 半角アルファベットと半角数字の2種類を使用して、6文字以上で入力してください。",
          "Password confirmation doesn't match Password")
      end
      it 'パスワードは、6文字未満では登録できない' do
        @user.password = @user.password.slice(0..2)+"a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは、数字のみでは登録できないこと' do
        @user.password = Faker::Number.number
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角アルファベットと半角数字の2種類を使用して、6文字以上で入力してください。")
      end
      it 'パスワードは、半角英のみでは登録できないこと' do
        @user.password = Faker::Alphanumeric.alpha
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角アルファベットと半角数字の2種類を使用して、6文字以上で入力してください。")
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password_confirmation = @user.password + "1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context "新規登録／本人情報の確認" do
      it 'ユーザー本名は、名字の入力が必須であること' do
      
      end
      it 'ユーザー本名は、名前の入力が必須であること' do
      
      end
      it 'ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        
      end
      it 'ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        
      end
      it 'ユーザー本名のフリガナは、名字の入力が必須であること' do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Last name reading can't be blank",
          "Last name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名のフリガナは、名前の入力が必須であること' do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "First name reading can't be blank",
          "First name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名字のフリガナは、半角（カタカナ）での入力できないこと' do
        @user.last_name_reading = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名字のフリガナは、半角英数字での入力できないこと' do
        @user.last_name_reading = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名字のフリガナは、全角ひらがなでの入力できないこと' do
        @user.last_name_reading = Gimei.last.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名字のフリガナは、全角英数字での入力できないこと' do
        @user.last_name_reading = "ａｂｃ１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名字のフリガナは、全角漢字での入力できないこと' do
        @user.last_name_reading = @user.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名前のフリガナは、半角（カタカナ）での入力ができないこと' do
        @user.first_name_reading = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名前のフリガナは、半角英数字での入力ができないこと' do
        @user.first_name_reading = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名前のフリガナは、全角ひらがなでの入力ができないこと' do
        @user.first_name_reading = Gimei.first.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名前のフリガナは、全角英数字での入力ができないこと' do
        @user.first_name_reading = "ａｂｃ１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角カタカナで入力してください")
      end
      it 'ユーザー本名の名前のフリガナは、漢字での入力ができないこと' do
        @user.first_name_reading = Gimei.first.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角カタカナで入力してください")
      end
      it '生年月日が必須であること' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end


