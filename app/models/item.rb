class Item < ApplicationRecord
  has_many:items 
  has_many:orders 
  has_one_attached :image

  validates :image,:name,:details,:price,:category_id,:status_id,:delivery_fee_id,:shiping_address_id,:shiping_date_id,:price,:user_id, presence: true 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shiping_date
  belongs_to :delivery_fee
  belongs_to :shiping_address
end

