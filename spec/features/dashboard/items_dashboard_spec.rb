RSpec.describe 'Item Dashboard Page' do
  before(:each) do
    @merchant = Merchant.create(name: "Wine Land")
    @item_1 = @merchant.items.create(name: "Zanti Red", description: "Red Wine", unit_price: 7, image: '../../public/images/capy-photo.jpg')
    @item_2 = @merchant.items.create(name: "Espinosa White", description: "White Wine", unit_price: 11, image: '../../public/images/capy-photo.jpg')
    @item_3 = @merchant.items.create(name: "McMahon Rose", description: "Rose Wine", unit_price: 15, image: '../../public/images/capy-photo.jpg')
  end

  it 'should show item dashboard heading' do
    visit '/items-dashboard'
    expect(page).to have_content("Items Dashboard")
  end

  it 'should show total item count' do
    visit '/items-dashboard'
    expect(page).to have_content("Total Item Count: 3")
  end

  it 'should show average item price' do
    visit '/items-dashboard'
    expect(page).to have_content("Avg Price Per Item: 11")
  end

end
