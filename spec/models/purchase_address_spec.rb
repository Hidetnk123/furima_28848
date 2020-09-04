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
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end

        it "postcodeが存在しないと購入できない" do
          @purchase_address.postcode = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
        end

        it "postcodeのハイフン（-）がないと購入できない" do
          @purchase_address.postcode = "1234567"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
        end

        it "prefecture_idが存在しないと出品できない" do
          @purchase_address.prefecture_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
        end
        it "prefecture_idが、id = 1の場合に出品できない" do
          @purchase_address.prefecture_id = "1"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it "cityが存在しないと出品できない" do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end

        it "addressが存在しないと出品できない" do
          @purchase_address.address = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
        end

        it "telが存在しないと出品できない" do
          @purchase_address.tel = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
        end
        it "telが存在しないと出品できない" do
          @purchase_address.tel = "123456789123"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
        end
      end
    end
end
