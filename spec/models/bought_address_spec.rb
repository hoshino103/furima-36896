require 'rails_helper'

RSpec.describe BoughtAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @bought_address = FactoryBot.build(:bought_address)
    end
    context '内容に問題がない場合' do
      it '全て正しい入力ができていれば保存できる' do
        expect(@bought_address).to be_valid
      end
      it '建物名以外正しい入力ができていれば保存できる' do
        @bought_address.building_name = ''
        expect(@bought_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空の場合保存できない' do
        @bought_address.post_num = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Post num can't be blank")
      end
      it '郵便番号が-無しの場合保存できない' do
        @bought_address.post_num = '1234567'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Post num is invalid")
      end
      it '郵便番号が全角の場合保存できない' do
        @bought_address.post_num = '１２３ー４５６７'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Post num is invalid")
      end
      it '都道府県が空の場合保存できない' do
        @bought_address.prefecture_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が--の場合保存できない' do
        @bought_address.prefecture_id = 0
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市町村が空の場合保存できない' do
        @bought_address.municipalities = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空の場合保存できない' do
        @bought_address.street_number = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号が空の場合保存できない' do
        @bought_address.phone_num = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号が-ありの場合保存できない' do
        @bought_address.phone_num = '090-1234-5678'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が全角の場合保存できない' do
        @bought_address.phone_num = '０９０１２３４５６７８'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @bought_address.user_id = nil
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @bought_address.item_id = nil
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Item can't be blank")
      end



    end
  end
end
