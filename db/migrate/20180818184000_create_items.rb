class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |i|
      i.text        :name
      i.text        :description
      i.integer     :unit_price
      i.string      :image
      i.integer     :merchant_id

      i.timestamps  null: false
    end
  end
end
