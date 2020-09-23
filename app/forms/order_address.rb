class OrderAddress

  include ActiveModel::Model

  attr_accessor :token, :item_id, :zip_code, :prefecture_id, :city, :house_number, :building, :telephone, :user_id, :price


  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :zip_code, presence: true, format: { with:/\A\d{3}[-]\d{4}\z/, message: '例)123-4567' }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :telephone, presence: true, format: { with:/\A\d{11}\z/, message: '例)09012345678' }
  
 
  def save

    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, telephone: telephone, user_id: user_id)

    Order.create(item_id: item_id, user_id: user_id)
  end

end