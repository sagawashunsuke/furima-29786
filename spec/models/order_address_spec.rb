require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
  
    @buyer = FactoryBot.create(:user)
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item,image:fixture_file_upload('/files/test_image.jpg'),user_id:@seller.id)
    @order_address = FactoryBot.build(:OrderAddress,item_id: @item.id,user_id:@buyer.id)
  end

  describe '商品購入' do
    context '商品の購入がうまくいくとき' do

      it "全て存在すれば購入できる" do
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it "郵便番号がなければ購入できない" do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it "都道府県がなければ購入できない" do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture is not a number")
      end
      it "市区町村がなければ購入できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地がなければ購入できない" do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号がなければ購入できない" do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it "郵便番号にハイフンがなければ購入できない" do
        @order_address.zip_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code 例)123-4567")
      end
      it "電話番号はハイフンがあると購入できない" do
        @order_address.telephone = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone 例)09012345678")
      end
      it "電話番号は11桁以内でないと購入できない" do
        @order_address.telephone = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone 例)09012345678")
      end
      it "トークンがなかったら購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end