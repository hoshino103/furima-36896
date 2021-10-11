require 'rails_helper'

RSpec.describe BoughtAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @user1 = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user1.id)
      @item.save
      @bought_address = FactoryBot.build(:bought_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
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
        expect(@bought_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号が-無しの場合保存できない' do
        @bought_address.post_num = '1234567'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("郵便番号は-を含む半角英数字で入力してください")
      end
      it '郵便番号が全角の場合保存できない' do
        @bought_address.post_num = '１２３ー４５６７'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("郵便番号は-を含む半角英数字で入力してください")
      end
      it '都道府県が空の場合保存できない' do
        @bought_address.prefecture_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '都道府県が--の場合保存できない' do
        @bought_address.prefecture_id = 0
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市町村が空の場合保存できない' do
        @bought_address.municipalities = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("市町村を入力してください")
      end
      it '番地が空の場合保存できない' do
        @bought_address.street_number = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空の場合保存できない' do
        @bought_address.phone_num = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が-ありの場合保存できない' do
        @bought_address.phone_num = '090-1234-5678'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("電話番号は-を含まない半角英数字で入力してください")
      end
      it '電話番号が全角の場合保存できない' do
        @bought_address.phone_num = '０９０１２３４５６７８'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("電話番号は-を含まない半角英数字で入力してください")
      end
      it '電話番号は、10桁以上11桁以内の条件以外、保存できない' do
        @bought_address.phone_num = '090123456789'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("電話番号は-を含まない半角英数字で入力してください")
      end
      it '電話番号が9桁以下では保存できない' do
        @bought_address.phone_num = '090123456'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("電話番号は-を含まない半角英数字で入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @bought_address.user_id = nil
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @bought_address.item_id = nil
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では登録できないこと' do
        @bought_address.token = nil
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end
