RSpec.describe 'Merchants Dashboard page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Beer World')
    @item_1 = @merchant_1.items.create(name: "Turing Ale", description: "Beer", unit_price: 5, image: '../../public/images/capy-photo.jpg')
    @item_2 = @merchant_1.items.create(name: "Delerium Tremens", description: "Beer", unit_price: 11, image: '../../public/images/capy-photo.jpg')
    @merchant_2 = Merchant.create(name: 'Wine World')
    @item_3 = @merchant_2.items.create(name: "Turing Ale", description: "Beer", unit_price: 12, image: '../../public/images/capy-photo.jpg')
  end
    it 'should show merchant dashboard heading' do
      visit '/merchants-dashboard'
      expect(page).to have_content("Merchants Dashboard")
    end
    it 'should show merchant with most items' do
      visit '/merchants-dashboard'
      expect(page).to have_content("Merchant With Most Items: #{Merchant.with_most_items.name}")
    end
    it 'should show merchant with highest price item' do
      visit '/merchants-dashboard'
      expect(page).to have_content("Merchant With Highest Price Item: #{Merchant.with_highest_price_item.name}")
    end
  end
