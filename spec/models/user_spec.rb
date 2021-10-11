require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべて正しい入力で新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'パスワードが必須であること。' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'T1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it '英字のみでは登録できないこと' do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it '全角だと登録できないこと' do
        @user.password = 'ｔｅｓｔｔｅｓｔ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'お名前(全角)は、名字が必須であること。' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(性)を入力してください")
      end
      it 'お名前(全角)は、名前が必須であること。' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(名)を入力してください")
      end
      it 'お名前(全角)名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(性)漢字、ひらがな、カタカナで入力してください")
      end
      it 'お名前(全角)名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(名)漢字、ひらがな、カタカナで入力してください")
      end
      it 'お名前カナ(全角)は、名字が必須であること。' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ(性)を入力してください")
      end
      it 'お名前カナ(全角)は、名前が必須であること。' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ(名)を入力してください")
      end
      it 'お名前カナ(全角)名字は、全角（カタカナ）での入力が必須であること。' do
        @user.family_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ(性)カタカナで入力してください")
      end
      it 'お名前カナ(全角)名前は、全角（カタカナ）での入力が必須であること。' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ(名)カタカナで入力してください")
      end
      it '生年月日が必須であること。' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
