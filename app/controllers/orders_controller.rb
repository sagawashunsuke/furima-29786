class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @address = OrderAddress.new
  end

  def create
    @address = OrderAddress.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def address_params
    @item = Item.find(params[:item_id])
    params.permit(:token, :item_id, :zip_code, :prefecture_id, :city, :house_number, :building, :telephone).merge(user_id: current_user.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = "sk_test_546a3204c9adde7a44b5dc0d"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount:address_params[:price],  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end

