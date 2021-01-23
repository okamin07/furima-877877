class Item < ApplicationRecord
  has_many:items 
  has_many:orders 
end
