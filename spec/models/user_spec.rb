require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '123aaa'
          @user.password_confirmation = '123aaa'
          expect(@user).to be_valid
       end

        context 'ユーザー登録がうまくいかないとき' do
          it 'nicknameが空だと登録できない' do
            @user.nickname = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Nickname can't be blank")
          end

          it 'emailが空だと登録できない' do
            @user.email = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Email can't be blank")
          end

          it 'emailに＠が含まれていないと登録できない' do
            @user.email = 'abc.com'
            @user.valid?
          end

          it 'passwordが空だと登録できない' do
            @user.password = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank")
          end

          it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
            @user.password_confirmation = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end

          it 'passwordが5文字以下だと登録できない' do
            @user.password = '12345'
            @user.password_confirmation = '12345'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
          end

          it 'passwordは半角英数字を含まないと登録できない' do
            @user.password = 'Aaaaaa'
            @user.password_confirmation = 'Aaaaaa'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
          end

          it 'last_nameが空だと登録できない' do
            @user.last_name = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank")
          end

          it 'last_nameが全角、漢字、ひらがな、カタカナ以外では登録できない' do
            @user.last_name = '1a'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name Full-width characters')
          end

          it 'first_nameが空だと登録できない' do
            @user.first_name = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank")
          end

          it 'first_nameが全角、漢字、ひらがな、カタカナ以外では登録できない' do
            @user.first_name = '1a'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name Full-width characters')
          end

          it 'last_name_kanaが空だと登録できない' do
            @user.last_name_kana = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana can't be blank")
          end

          it 'last_name_kanaがカタカナではないと登録できない' do
            @user.last_name_kana = 'たなか'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
          end

          it 'first_name_kanaが空だと登録できない' do
            @user.first_name_kana = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank")
          end

          it 'first_name_kanaがカタカナでないと登録できない' do
            @user.first_name_kana = 'さとし'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
          end

          it 'birthdayが空だと登録できない' do
            @user.birthday = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end

          it '既に登録されたemailがある場合登録できない' do
            @user.save
            another_user = FactoryBot.build(:user, email: @user.email)
            another_user.valid?
            expect(another_user.errors.full_messages).to include('Email has already been taken')
          end
        end
      end
    end
  end
end
