class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status:{credit: 0, bank: 1}
end
