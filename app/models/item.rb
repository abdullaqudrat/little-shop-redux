class Item < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :image

  def self.total_count
    Item.count
  end

  def self.avg_price
    Item.average(:unit_price)
  end

  def self.newest_item
    Item.order(:created_at).last.name
  end

  def self.oldest_item
    Item.order(:created_at).first.name
  end
end
