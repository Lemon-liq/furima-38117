require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @delivery = FactoryBot.build(:buy_delivery, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@delivery).to be_valid
      end
      it 'address_line2は空でも購入できること' do
        @delivery.address_line2 = ''
        expect(@delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと購入できないこと' do
        @delivery.zip_code = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @delivery.zip_code = '1234567'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include('郵便番号にハイフン(-)が含まれていません')
      end
      it 'prefectureを選択していないと購入できないこと' do
        @delivery.prefecture_id = 1
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空だと購入できないこと' do
        @delivery.city = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'caddress_line1が空だと購入できないこと' do
        @delivery.address_line1 = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("番地を入力してください")
      end
      it 'telが空だと購入できないこと' do
        @delivery.tel = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'telが9桁以下では購入できないこと' do
        @delivery.tel = '090123456'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include('電話番号には10,11桁の半角数字を入力してください')
      end
      it 'telが12桁以上では購入できないこと' do
        @delivery.tel = '090123456789'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include('電話番号には10,11桁の半角数字を入力してください')
      end
      it 'telが全角数値では購入できないこと' do
        @delivery.tel = '０９０１２３４５６７８'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include('電話番号には10,11桁の半角数字を入力してください')
      end
      it 'telが半角英語では購入できないこと' do
        @delivery.tel = 'aaaaaaaaaaa'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include('電話番号には10,11桁の半角数字を入力してください')
      end
      it 'userが紐付いていないと購入できないこと' do
        @delivery.user_id = nil
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @delivery.item_id = nil
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では購入できないこと' do
        @delivery.token = nil
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
