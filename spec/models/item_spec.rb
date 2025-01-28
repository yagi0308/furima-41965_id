require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム新規登録' do
    context '正常系' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it '商品の状態が空では登録できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it '配送料の負担が空では登録できない' do
        @item.item_shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee can't be blank")
      end

      it '発送元の地域が空では登録できない' do
        @item.item_prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end

      it '発送までの日数が空では登録できない' do
        @item.item_scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end

      it '販売価格が空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '商品名が40文字以上では登録できない' do
        @item.item_name = 'a' * 40
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 39 characters)')
      end

      it '商品の説明が1000文字以上では登録できない' do
        @item.item_info = 'a' * 1000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item info is too long (maximum is 999 characters)')
      end
    end
  end
end
