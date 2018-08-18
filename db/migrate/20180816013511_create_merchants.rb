class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |m|
      m.text        :name
      m.timestamps  null: false
    end
  end
end
