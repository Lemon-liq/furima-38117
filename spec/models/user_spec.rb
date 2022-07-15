require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password,password_confirmation,last_name,first_name,last_name_katakana,first_name_katakanaとbirthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'last_nameが英語では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字には全角（漢字・ひらがな・カタカナ）文字を使用してください')
      end
      it 'last_nameが数字では登録できない' do
        @user.last_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字には全角（漢字・ひらがな・カタカナ）文字を使用してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_nameが英語では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前には全角（漢字・ひらがな・カタカナ）文字を使用してください')
      end
      it 'first_nameが数字では登録できない' do
        @user.first_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前には全角（漢字・ひらがな・カタカナ）文字を使用してください')
      end
      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end
      it 'last_name_katakanaが英語では登録できない' do
        @user.last_name_katakana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'last_name_katakanaが数字では登録できない' do
        @user.last_name_katakana = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'last_name_katakanaが漢字では登録できない' do
        @user.last_name_katakana = '亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'last_name_katakanaがひらがなでは登録できない' do
        @user.last_name_katakana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'first_name_katakanaが英語では登録できない' do
        @user.first_name_katakana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'first_name_katakanaが数字では登録できない' do
        @user.first_name_katakana = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'first_name_katakanaが漢字では登録できない' do
        @user.first_name_katakana = '亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'first_name_katakanaがひらがなでは登録できない' do
        @user.first_name_katakana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）には全角（カタカナ）文字を使用してください')
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
