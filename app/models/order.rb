class Order < ApplicationRecord
    belongs_to :customer
    enum payment_method:{credit: 0, bank: 1}
    has_many :order_details, dependent: :destroy
end