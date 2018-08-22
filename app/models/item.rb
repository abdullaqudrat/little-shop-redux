class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :image

  def self.total_count
    Item.count
  end

  def self.avg_price
    avg = (Item.average(:unit_price)).round(2)
  end

  def self.newest_item
    Item.order(:created_at).last
  end

  def self.oldest_item
    Item.order(:created_at).first
  end
end
