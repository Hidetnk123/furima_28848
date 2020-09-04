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
      end
    end
end
