class Item < ActiveRecord::Base
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :image
end