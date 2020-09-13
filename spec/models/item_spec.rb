require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品登録' do
      context '商品登録がうまくいくとき' do
        it '全て埋めたら登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品登録がうまくいかないとき' do
        it '商品名が空だと登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'textが空だと登録できない' do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end

        it 'category_idが選択されていないと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it 'status_idが選択されていないと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end

        it 'postage_type_idが選択されていないと登録できない' do
          @item.postage_type_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Postage type must be other than 1')
        end

        it 'ship_from_idが選択されていないと登録できない' do
          @item.ship_from_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Ship from must be other than 1')
        end

        it 'delivery_time_idが選択されていないとき登録できない' do
          @item.delivery_time_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery time must be other than 1')
        end

        it 'priceが入力されていないと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが300以下だと登録できない' do
          @item.price = '100'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it 'priceが9999999以上だと登録されない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it 'priceが半角数字で入力しないと登録できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it 'imageが選択されていないと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
  end
end
