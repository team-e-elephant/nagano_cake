class Order < ApplicationRecord
    belongs_to :customer
    enum payment_method:{credit: 0, bank: 1}
    enum status:{pending: 0, confirmed: 1, processing: 2, preparing: 3, shipped: 4}
    has_many :order_details, dependent: :destroy
end