require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it '必須事項が記入されている場合、購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号が空では保存できない' do
        @order_address.postcode = nil
        @order_address.valid?
        expect(@order_address.errors[:postcode]).to include('を入力してください')
      end

      it '郵便番号が全角数字では保存できない' do
        @order_address.postcode = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors[:postcode]).to include('はハイフンを含む半角数字7桁で入力してください')
      end

      it '郵便番号がハイフンを含む正しい形式で入力されていない場合、保存できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors[:postcode]).to include('はハイフンを含む半角数字7桁で入力してください')
      end

      it '郵便番号が英字の場合、保存できない' do
        @order_address.postcode = 'abc-defg'
        @order_address.valid?
        expect(@order_address.errors[:postcode]).to include('はハイフンを含む半角数字7桁で入力してください')
      end

      it '都道府県が選択されていない場合、保存できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors[:prefecture_id]).to include('を入力してください')
      end

      it '市区町村が空では保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors[:city]).to include('を入力してください')
      end

      it '番地が空では保存できない' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors[:block]).to include('を入力してください')
      end

      it '電話番号が空では保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include('を入力してください')
      end

      it '電話番号が全角数字では保存できない' do
        @order_address.phone_number = '０８０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include('は半角数字で入力してください')
      end

      it '電話番号が英字では保存できない' do
        @order_address.phone_number = 'abcdefghijk'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include('は半角数字で入力してください')
      end

      it '電話番号が12桁以上では保存できない' do
        @order_address.phone_number = '080123456789'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include('は11文字以内で入力してください')
      end

      it '電話番号にハイフンが含まれている場合、保存できない' do
        @order_address.phone_number = '080-123-456'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include('は半角数字で入力してください')
      end

      it 'user_idが存在しない場合、保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors[:user_id]).to include('を入力してください')
      end

      it 'item_idが存在しない場合、保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors[:item_id]).to include('を入力してください')
      end

      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors[:token]).to include('を入力してください')
      end
    end
  end
end
