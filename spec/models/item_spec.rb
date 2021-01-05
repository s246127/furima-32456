require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての項目が入力されていれば登録ができること' do
        @item = FactoryBot.create(:item)
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explainが空では登録できない' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'priceがない場合は登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'category_idが空の場合は登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1の場合は登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_id がない場合は登録できないこと' do
        @item.condition_id  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_id が1の場合は登録できないこと' do
        @item.condition_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'postage_idがない場合は登録できないこと' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'postage_idが1の場合は登録できないこと' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it 'prefecture_idがない場合は登録できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが0の場合は登録できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'shipping_date_idがない場合は登録できないこと' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it 'shipping_date_idが1の場合は登録できないこと' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end

      it 'priceが全角数字の場合は登録できないこと' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが299円以下の場合は登録できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10000000以上の場合は登録できないこと' do
        @item.price = 1000000000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
      it 'priceは半角英語だけでは登録できないこと' do
        @item.price = "fdhg"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceは半角英数混合では登録できないこと' do
        @item.price = "1sdfg4"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
