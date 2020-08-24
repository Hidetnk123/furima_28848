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
  end
end
