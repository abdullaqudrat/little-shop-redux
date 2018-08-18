class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |i|
      i.integer     :customer_id
      i.integer     :merchant_id
      i.text        :status

      i.timestamps  null: false
    end 
  end
end
