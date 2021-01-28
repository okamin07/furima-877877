require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
   describe "商品出品機能" do
    context "出品できる場合" do
      it "必須項目（商品名,商品画像,カテゴリー,状態,配送の負担/地域/日数)が存在し、販売価格が適切であれば登録できること" do
        expect(@item).to be_valid
      end
    end
    context "出品できない場合" do
      it "画像がなければ登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空では登録できない" do
        @item.details = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it "商品の状態が空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担が空では登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "発送元の地域が空では登録できない" do
        @item.shiping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shiping date can't be blank")
      end
      it "発送日数が空では登録できない" do
        @item.shiping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shiping date can't be blank")
      end
      it "販売価格が空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が全角では登録できない" do
        @item.price = "７００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が¥300以下では登録できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が¥9,999,999以上では登録できない" do
        @item.price = "109999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end
end