class Order < ApplicationRecord
    belongs_to :customer
    enum payment_methods: { 銀行振込:0, クレジットカード:1 }
end
