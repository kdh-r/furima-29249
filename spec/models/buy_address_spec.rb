require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '#create' do
    before do
      item = FactoryBot.build(:item)
      user = FactoryBot.build(:user)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end

    describe '商品購入' do
      context '商品購入がうまくいくとき' do
        it '全て入力されていれば購入できる' do
          expect(@buy_address).to be_valid
        end

        it '建物が空欄でも登録できる' do
          @buy_address.building = nil
          expect(@buy_address).to be_valid
        end
      end


      context '商品購入がうまくいかないとき' do
        it 'カード情報が適切に打ち込まれていないと購入できない' do
          @buy_address.token = nil
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Token can't be blank")
        end

        it '郵便番号が空では購入できない' do
          @buy_address.postal_code = nil
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it '郵便番号はハイフンがないと購入できない' do
          @buy_address.postal_code = '1234567'
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
        end

        it '都道府県が選択されていないと購入できない' do
          @buy_address.prefecture_id = 1
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '市区町村が入力されていないと購入できない' do
          @buy_address.city = nil
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("City can't be blank")
        end

        it '番地が入力されていないと購入できない' do
          @buy_address.address = nil
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号がないと購入できない' do
          @buy_address.phone_number = nil
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号はハイフン不要で11桁以内であること' do
          @buy_address.phone_number = '090-4444-44'
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
        end
      end
    end
  end
end
