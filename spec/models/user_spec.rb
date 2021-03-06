require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "必須入力フォームが存在すれば登録できる" do
      expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは不正な値です")
      end
      it "emailは一意性であるので、重複したら登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailは、@がないと登録できない" do
        @user.email = "test12gamil.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "t1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数混合でないと登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角）を入力してください")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないとと登録できない" do
        @user.last_name = "lastname"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角）は不正な値です")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角）を入力してください")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "firstname"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角）は不正な値です")
      end

      it "katakana_last_nameが空だと登録できない" do
        @user.katakana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角カナ）を入力してください")
      end
      it "katakana_last_nameが全角（カタカナ）でないと登録できない" do
        @user.katakana_last_name = "lastname"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角カナ）は不正な値です")
      end
      it "katakana_first_nameが空だと登録できない" do
        @user.katakana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角カナ）を入力してください")
      end
      it "katakana_first_nameが全角（カタカナ）でないと登録できない" do
        @user.katakana_first_name = "firstname"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角カナ）は不正な値です")
      end

      it "birthが空だと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
