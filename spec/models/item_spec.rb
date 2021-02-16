require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '正しい情報を入力すると出品ができる。' do
      it '正しい情報を入力すると出品できる' do
        expect(@item).to be_valid
      end
    end

    context '必要な情報が抜けている場合、出品できない。' do
      it '商品画像が含まれていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが選ばれていないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it '商品の状態が選ばれていないと出品できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank", "State is not a number")
      end
      it '配送料負担が選ばれていないと出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
      end
      it '発送までの日数が選ばれていないと出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")
      end
      it '価格が入力されていないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
    end

    context '特定の値以外の数値が入力されていると、出品できない。' do
      it 'カテゴリーが---の状態だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態が---だと出品できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 0")
      end
      it '配送料負担が---だと出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 0")
      end
      it '発送元の地域が---だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数が---だと出品できない' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
      end
      it '金額が299円以下だと出品できない' do
        @item.price = Faker::Number.within(range: 1..299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '金額が10,000,000円以上だと出品できない' do
        @item.price = Faker::Number.positive.to_i + 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '金額がマイナスだと出品できない' do
        @item.price = Faker::Number.negative.to_i
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '金額に文字列が入っていると出品できない' do
        @item.price = Faker::Lorem.word
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '金額に小数点が入っていると出品できない' do
        @item.price = Faker::Number.decimal(r_digits: 1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it '金額に全角数字が入っていると出品できない' do
        @item.price = "９０９"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
