class Invoice < ActiveRecord::Base
  belongs_to  :merchant
  has_many :invoice_items
  
  validates_presence_of :merchant_id,
                        :status

end
