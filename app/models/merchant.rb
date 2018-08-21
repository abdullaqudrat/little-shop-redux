class Merchant < ActiveRecord::Base
  has_many  :items
  has_many  :invoices

  validates_presence_of :name

  def total_item_count
    items.count
  end

  def average_item_price
    items.average(:unit_price)
  end

  def total_price_of_all_items
    items.sum(:unit_price)
  end

  def self.with_most_items
    highest_merchant_id = Item.group(:merchant_id).order("count_all").count.keys.last
    Merchant.where(id: highest_merchant_id).first.name
  end
end
