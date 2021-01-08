require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'building_number以外の全ての項目が入力されていれば登録ができること' do
        @order = FactoryBot.create(:order)
        expect(@order).to be_valid
      end

      it '電話番号にハイフンがなくても登録できること' do
        @order.phone_number = "09067231234"
        expect(@order).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'user_idが空だと登録できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_numberがない場合は登録できないこと' do
        @order.postal_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal number can't be blank")
      end

      it 'prefecture_idが空の場合は登録できないこと' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

     

      it 'city がない場合は登録できないこと' do
        @order.city  = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

     

      it 'districtがない場合は登録できないこと' do
        @order.district = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("District can't be blank")
      end

    

      it 'phone_numberがない場合は登録できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number number is invalid. Include half-width numbers")
      end

      it '郵便番号にハイフンがない場合は登録できないこと' do
        @order.postal_number = "3442890"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
      end
   
      it '電話番号が11桁以内でない場合は登録できないこと' do
        @order.phone_number = "09067233456245"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number number is invalid. Include half-width numbers")
      end
    end


  end
end
