require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe "#create" do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address.user_id = user.id
      @purchase_address.item_id = item.id
      sleep 0.01
    end
    context '正しく情報が入力されていれば保存できる' do
      it 'すべての情報で正しく入力がされている場合は保存ができる' do
        expect(@purchase_address).to be_valid
      end
      it 'ビル名は空欄でも保存できる' do
        @purchase_address.building = ""
        expect(@purchase_address).to be_valid
      end
    end

    context '購入情報が不足していると保存できない' do
      it 'user_idがないと保存できない' do
        @purchase_address.user_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと保存できない' do
        @purchase_address.item_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenがないと保存できない' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '住所の情報が間違っていると保存できない' do
      it '郵便番号が入っていないと保存できない' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it '郵便番号でハイフンが入っていないと保存できない' do
        @purchase_address.postal_code = Faker::Number.leading_zero_number(digits: 7)
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが0だと保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'cityが入力されていないと保存できない' do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていないと保存できない' do
        @purchase_address.house_num = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が入っていないと保存できない' do
        @purchase_address.tel_num = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num can't be blank")
      end
      it '電話番号が11桁より多いと保存できない' do
        @purchase_address.tel_num = Faker::Number.leading_zero_number(digits: 12)
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num must be integer and less than or equal 11 digits.")
      end
      it '電話番号に文字列が含まれていると保存できない' do
        @purchase_address.tel_num = Faker::Number.leading_zero_number(digits: 10) + "a"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num must be integer and less than or equal 11 digits.")
      end
    end
  end
end
