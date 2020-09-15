require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
  
    describe '商品購入' do
      context '商品購入がうまくいく時' do
        it "必須入力フォームを入力すれば購入できる" do
        expect(@purchase_address).to be_valid
        end
      end

      context '商品購入がうまくいかない時' do
        it "tokenが存在しないと購入できない" do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
        end

        it "postcodeが存在しないと購入できない" do
          @purchase_address.postcode = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
        end

        it "postcodeのハイフン（-）がないと購入できない" do
          @purchase_address.postcode = "1234567"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
        end

        it "prefecture_idが存在しないと出品できない" do
          @purchase_address.prefecture_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
        end
        it "prefecture_idが、id = 1の場合に出品できない" do
          @purchase_address.prefecture_id = "1"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
        end

        it "cityが存在しないと出品できない" do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
        end

        it "addressが存在しないと出品できない" do
          @purchase_address.address = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
        end

        it "telが存在しないと出品できない" do
          @purchase_address.tel = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
        end
        it "電話番号にハイフンがあると出品できない" do
          @purchase_address.tel = "123-4567-8912"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
        end
      end
    end
end
