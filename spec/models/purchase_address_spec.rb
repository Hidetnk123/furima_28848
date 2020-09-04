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
    end
end
