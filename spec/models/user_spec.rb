require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
     end
     it "パスワードが必須であること" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
     end
     
     it "パスワードは6文字以上の半角英数字だと保存される" do
      user = build(:user, password: "000000a", password_confirmation: "000000a")
      expect(user).to be_valid
     end

     it "パスワードは、6文字以上での入力が必須であること" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
     end
    
     it "pw6文字以上でも、数字だけやと保存できんはず" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
      end

      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        user = build(:user, password_confirmation: "00000a0")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
       end

     it "メールアドレスが一意性であること" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
     end

     it "メールアドレスは、@を含む必要があること" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
     end

     it "last_nameが空では登録できない" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
     end
     it "first_nameが空では登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
     end
     it "last_name_kanaが空では登録できない" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
     end
     it "first_name_kanaが空では登録できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
     end
     it "birthdayが空では登録できない" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
     end
   end
 end

 
 
 
 
 
 

