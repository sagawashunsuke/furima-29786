class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order

  # @item.order => Order id:3
  #             => nil
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image
  
  validates :name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :genre_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, numericality: { other_than: 1 }
  validates :image, presence: true
  validates :price, presence: true, format: { with:/\A[0-9]+\z/i, message: '半角英数字を使用してください' }
  validates :price, inclusion: { in: 300..9999999 }
  
end
