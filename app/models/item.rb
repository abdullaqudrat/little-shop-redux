class Item < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :image,
                        :merchant_id
end
