  class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    has_one :order
    belongs_to_active_hash :prefecture
    
end

