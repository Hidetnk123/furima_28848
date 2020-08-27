require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいく時' do
      it "必須入力フォームが存在すれば出品できる" do
      expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it "imageが存在しないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが存在しないと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "contentが存在しないと出品できない" do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it "category_idが存在しないと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "item_status_idが存在しないと出品できない" do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
      end
      it "delivery_pay_idが存在しないと出品できない" do
        @item.delivery_pay_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery pay can't be blank", "Delivery pay is not a number")
      end
      it "delivery_area_idが存在しないと出品できない" do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank", "Delivery area is not a number")
      end
      it "delivery_day_idが存在しないと出品できない" do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
      end
      it "priceが存在しないと出品できない" do
        @item.price  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceは半角数字でないと出品できない" do
        @item.price  = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが、¥300以下だと出品できない" do
        @item.price  = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが、¥9,999,999以上だと出品できない" do
        @item.price  = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
