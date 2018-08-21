RSpec.describe 'Item Dashboard Page' do
  before(:each) do
    @item_1 = Item.create(name: "Zanti Red", description: "Red Wine", unit_price: 7, image: '../../public/images/capy-photo.jpg')
    @item_2 = Item.create(name: "Espinosa White", description: "White Wine", unit_price: 11, image: '../../public/images/capy-photo.jpg')
    @item_3 = Item.create(name: "McMahon Rose", description: "Rose Wine", unit_price: 15, image: '../../public/images/capy-photo.jpg')
  end

  it 'should show item dashboard heading' do
    visit '/items-dashboard'
    expect(page).to have_content("Items Dashboard")
  end

  it 'should show total item count' do
    visit '/items-dashboard'
    expect(page).to have_content(Item.total_count)
  end

  it 'should show average item price' do
    visit '/items-dashboard'
    expect(page).to have_content(Item.avg_price)
  end

end
