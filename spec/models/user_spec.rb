require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name_kana: "オカムラ",first_name_kana: "オケオ",last_name: "岡村",first_name: "桶男",birthday: "1935-07-10")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "passwordが空では登録できない" do
      user = User.new(nickname: "おかみん", email: "kkk@gmail.com", password: "", password_confirmation: "",last_name_kana: "オカムラ",first_name_kana: "オケオ",last_name: "岡村",first_name: "桶男",birthday: "1935-07-10")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it "last_nameが空では登録できない" do
      user = User.new(nickname: "おかみん", email: "kkk@gmail.com", password: "00000000a", password_confirmation: "00000000a",last_name_kana: "オカムラ",first_name_kana: "オケオ",last_name: "",first_name: "桶男",birthday: "1935-07-10")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
     end
     it "first_nameが空では登録できない" do
      user = User.new(nickname: "おかみん", email: "kkk@gmail.com", password: "00000000a", password_confirmation: "00000000a",last_name_kana: "オカムラ",first_name_kana: "オケオ",last_name: "岡村",first_name: "",birthday: "1935-07-10")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
     end
     it "last_name_kanaが空では登録できない" do
      user = User.new(nickname: "おかみん", email: "kkk@gmail.com", password: "00000000a", password_confirmation: "00000000a",last_name_kana: "",first_name_kana: "オケオ",last_name: "岡村",first_name: "桶男",birthday: "1935-07-10")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "おかみん", email: "kkk@gmail.com", password: "00000000a", password_confirmation: "00000000a",last_name_kana: "オカムラ",first_name_kana: "",last_name: "岡村",first_name: "桶男",birthday: "1935-07-10")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
     end
     it "birthdayが空では登録できない" do
      user = User.new(nickname: "おかみん", email: "kkk@gmail.com", password: "00000000a", password_confirmation: "00000000a",last_name_kana: "オカムラ",first_name_kana: "オケオ",last_name: "岡村",first_name: "桶男",birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end

 

 

