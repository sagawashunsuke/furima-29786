class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image
  
  # validates :category
  # validates :delivery_fee
  # validates :user
  # validates :name
  # validates :text
  # validates :condition
  # validates :price
  # validates :shipping_area
  # validates :shipping_day
end
