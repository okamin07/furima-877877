class Item < ApplicationRecord
  has_many:items 
  has_many:orders 
  has_one_attached :image

  validates :image,:name,:details,:category_id,:status_id,:delivery_fee_id,:shiping_address_id,:shiping_date_id,:price,:user_id, presence: true 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to:9999999},format: {with: /\A[0-9]+\z/}
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shiping_date
  belongs_to :delivery_fee
  belongs_to :shiping_address
end

