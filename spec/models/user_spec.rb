require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe "ユーザー新規登録" do
    context "新規登録できる場合" do
      it "nickname,email,password,password_confirmation,last_name_kana,first_name_kana,last_name,first_name,birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end
    context "新規登録ができない場合" do
      it "nicknameが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードは、6文字以上でなければ登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "英字が含まれないパスワードは登録できない" do
        @user.password = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードとパスワード（確認用）が異なる場合登録できない" do
        @user.password = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "登録ずみemailでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "@を含まないメールアドレスでは登録できない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが漢字/かな以外では登録できない" do
        @user.last_name = "okamu"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_nameが漢字/かな以外では登録できない" do
        @user.first_name = "okamu"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaがカナ以外では登録できない" do
        @user.last_name_kana = "おかみん"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana カタカナを使用してください")
      end
      it "first_name_kanaがカナ以外では登録できない" do
        @user.first_name_kana = "おかみん"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana カタカナを使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
 end

 
 
 
 
 
 

 