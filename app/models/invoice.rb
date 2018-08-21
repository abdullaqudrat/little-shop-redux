class Invoice < ActiveRecord::Base
  belongs_to  :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates_presence_of :merchant_id,
                        :status

  def self.status_percentage(status)
    invoice_status = Invoice.where(status: status).count
    ((invoice_status.to_f / Invoice.count) * 100).to_i
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
    grouped = InvoiceItem.group(:invoice_id).sum(:quantity)
    grouped.sort_by(&:last).last[0]
  end

  def self.lowest_quantity
    grouped = InvoiceItem.group(:invoice_id).sum(:quantity)
    grouped.sort_by(&:last).first[0]
  end
end
