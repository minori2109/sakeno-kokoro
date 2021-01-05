require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '会員登録機能' do
    context '会員登録ができるとき' do
      it '必須事項(nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthday)が記入されている場合、会員登録ができる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上の英数混合であれば登録できる' do
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
      end
    end

    context '会員登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include('を入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'emailに「＠」が含まれていない場合、登録できない' do
        @user.email = 'abcmail.com'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end

      it 'すでに登録されているemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors[:email]).to include('has already been taken')
      end

      it 'passwordが5文字以下の場合、登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors[:password]).to include('には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = 123_456
        @user.password_confirmation = 123_456
        @user.valid?
        expect(@user.errors[:password]).to include('には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが全角英数字では登録できない' do
        @user.password = 'ｐａｓｓ１２３'
        @user.password_confirmation = 'ｐａｓｓ１２３'
        @user.valid?
        expect(@user.errors[:password]).to include('には英字と数字の両方を含めて設定してください')
      end

      it 'passwordがpassword_confirmationと一致しない場合、登録できない' do
        @user.password = 'pass123'
        @user.password_confirmation = '123pass'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'passwordが入力されていても、password_confirmationが空欄では登録できない' do
        @user.password = 'pass123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'last_nameが空欄の場合、登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors[:last_name]).to include('を入力してください')
      end

      it 'first_nameが空欄の場合、登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include('を入力してください')
      end

      it 'last_nameが半角カタカナの場合、登録できない' do
        @user.last_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors[:last_name]).to include('は全角で入力してください')
      end

      it 'first_nameが半角カタカナの場合、登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors[:first_name]).to include('は全角で入力してください')
      end

      it 'last_name_kanaが空欄の場合、登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('を入力してください')
      end

      it 'first_name_kanaが空欄の場合、登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('を入力してください')
      end

      it 'last_name_kanaが半角カタカナの場合、登録できない' do
        @user.last_name_kana = 'ｻﾄｳ'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('は全角カタカナで入力してください')
      end

      it 'first_name_kanaが半角カタカナの場合、登録できない' do
        @user.first_name_kana = 'ｼﾞﾛｳ'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('は全角カタカナで入力してください')
      end

      it 'last_name_kanaがひらがなの場合、登録できない' do
        @user.last_name_kana = 'いとう'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('は全角カタカナで入力してください')
      end

      it 'first_name_kanaがひらがなの場合、登録できない' do
        @user.first_name_kana = 'しょう'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('は全角カタカナで入力してください')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors[:birthday]).to include('を入力してください')
      end
    end
  end
end
