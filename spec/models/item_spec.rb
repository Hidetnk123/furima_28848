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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it "nameが存在しないと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品名を入力してください")
      end

      it "contentが存在しないと出品できない" do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it "category_idが存在しないと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "category_idが、id = 1の場合に出品できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end

      it "item_status_idが存在しないと出品できない" do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "item_status_idが、id = 1の場合に出品できない" do
        @item.item_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end

      it "delivery_pay_idが存在しないと出品できない" do
        @item.delivery_pay_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "delivery_pay_idが、id = 1の場合に出品できない" do
        @item.delivery_pay_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end

      it "delivery_area_idが存在しないと出品できない" do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it "delivery_area_idが、id = 1の場合に出品できない" do
        @item.delivery_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end

      it "delivery_day_idが存在しないと出品できない" do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "delivery_day_idが、id = 1の場合に出品できない" do
        @item.delivery_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end

      it "priceが存在しないと出品できない" do
        @item.price  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it "priceは半角数字でないと出品できない" do
        @item.price  = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it "priceが、¥300以下だと出品できない" do
        @item.price  = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it "priceが、¥9,999,999以上だと出品できない" do
        @item.price  = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
    end
  end
end
