class Invoice < ActiveRecord::Base
  belongs_to  :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates_presence_of :merchant_id,
                        :status

  def self.status_percentage(status)
    invoice_status = Invoice.where(status: status).count
    (invoice_status.to_f / Invoice.count) * 100
  end

  def self.highest_unit_price
    highest_item = InvoiceItem.maximum(:unit_price)
    InvoiceItem.where(unit_price: highest_item).first.invoice_id
  end

  def self.lowest_unit_price
    lowest_item = InvoiceItem.minimum(:unit_price)
    InvoiceItem.where(unit_price: lowest_item).first.invoice_id
  end

  def self.highest_quantity
    highest_item = InvoiceItem.maximum(:quantity)
    InvoiceItem.where(quantity: highest_item).first.invoice_id
  end

  def self.lowest_quantity
    lowest_item = InvoiceItem.minimum(:quantity)
    InvoiceItem.where(quantity: lowest_item).first.invoice_id
  end
end
