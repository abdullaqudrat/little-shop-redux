class Merchant < ActiveRecord::Base
  has_many  :items
  has_many  :invoices

  validates_presence_of :name

  def self.total_item_count(merchant_id)
    Merchant.find(merchant_id).items.count
  end

  def self.average_item_price(merchant_id)
    merchant = Merchant.find(merchant_id).items
    merchant.average(:unit_price)
  end

  def self.total_price_of_all_items(merchant_id)
    merchant = Merchant.find(merchant_id).items
    merchant.sum(:unit_price)
  end

  def self.with_most_items
    joins(:items).group(:name ).count
  # require 'pry' ; binding.pry
  end
end
