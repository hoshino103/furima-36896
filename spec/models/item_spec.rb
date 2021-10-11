require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context '商品情報がデータベースに保存できる場合' do
      it '必要な情報が正しく入力された場合保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像をアップロードしてください")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が必須であること' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'カテゴリーの情報が--以外であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態の情報が必須であること' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '商品の状態の情報が--以外であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料の負担の情報が必須であること' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '配送料の負担の情報が--以外であること' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元の地域の情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送元の地域の情報が--以外であること' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送までの日数の情報が必須であること' do
        @item.send_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日時を入力してください")
      end
      it '発送までの日数の情報が--以外であること' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日時を選択してください")
      end
      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格は、¥300~¥9,999,999の間のみ保存可能であること(小さい場合)' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角英数字で入力してください")
      end
      it '価格は、¥300~¥9,999,999の間のみ保存可能であること(大きい場合)' do
        @item.price = '999999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角英数字で入力してください")
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角英数字で入力してください")
      end
      it '出品者がいない場合' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
