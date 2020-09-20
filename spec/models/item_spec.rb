require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it "全て存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまくいかないとき' do
      it "画像がなければ出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空では登録できないこと" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "genre_idが空では登録できないこと" do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre is not a number")
      end
      it "status_idが空では登録できないこと" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "delivery_fee_idが空では登録できないこと" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end
      it "shipping_area_idが空では登録できないこと" do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end
      it "shipping_day_idが空では登録できないこと" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is not a number")
      end
      it "priceが空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price 半角英数字を使用してください", "Price is not included in the list")
      end
      it "priceが300~9999999でないと登録できないこと" do
        @item.price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceは半角数字でないと登録できないこと" do
        @item.price = "１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが10,000,000以上だと登録できないこと" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "genre_idが--を示すid値(1)だと出品登録できない" do
        @item.genre_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre must be other than 1")
      end
      it "status_idが--を示すid値(1)だと出品登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "delivery_fee_idが--を示すid値(1)だと出品登録できない" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "shipping_area_idが--を示すid値(1)だと出品登録できない" do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "shipping_day_idが--を示すid値(1)だと出品登録できない" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
    end
  end
end