class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |i|
      i.integer     :item_id
      i.integer     :invoice_id
      i.integer     :quantity
      i.integer     :unit_price

      i.timestamps  null: false
    end
  end
end
