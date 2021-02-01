class Item < ApplicationRecord
  has_one :order 
  belongs_to :user 
  has_one_attached :image

with_options presence: true do
  validates :image
  validates :name
  validates :details
  validates :category_id
  validates :status_id
  validates :delivery_fee_id
  validates :shiping_address_id
  validates :shiping_date_id
  validates :user_id
end

  validates :price,
    presence: true,
    numericality: {only_integer: true},
    numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to:9999999},
    format: {with: /\A[0-9]+\z/}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shiping_date
  belongs_to :delivery_fee
  belongs_to :shiping_address
end

