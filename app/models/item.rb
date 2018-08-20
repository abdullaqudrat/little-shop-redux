class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :image
end
