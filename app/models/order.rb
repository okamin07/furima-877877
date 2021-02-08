class Order < ApplicationRecord
  has_one:item 
  has_one:address
  belongs_to:user
end
