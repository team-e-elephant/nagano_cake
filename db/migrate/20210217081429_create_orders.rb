class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :total_payment,   default: 0
      t.integer :payment_method
      t.integer :status,          default: 0
      t.timestamps
    end
  end
end
