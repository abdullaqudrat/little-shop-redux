RSpec.describe 'Item index page' do
  before(:each) do
    @item_1 = Item.create(name: "Turing Ale", description: "Beer", unit_price: 4, image: '../../images/capy-photo.jpg')
    @item_2 = Item.create(name: "Delerium Tremens", description: "Beer", unit_price: 12, image: '../../images/capy-photo.jpg')
  end
  it 'should show item heading' do
    visit '/items'
    expect(page).to have_content("Items")
  end

  it 'should show all item names' do
    visit '/items'
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
  end

  it 'should show all item prices' do
    visit '/items'
    expect(page).to have_content(@item_1.unit_price)
    expect(page).to have_content(@item_2.unit_price)
  end

  it 'should show all item images' do
    visit '/items'

    page.has_xpath?(@item_1.image)
    page.has_xpath?(@item_2.image)
  end

  xit 'item name should have link to item show page' do
    visit '/items'
    click_on @item_1.name
    expect(current_path).to eq("/items/#{@item_1.id}")
  end

  it 'item index should have link to item create page' do
    visit '/items'
    click_on 'Create A New Item'
    expect(current_path).to eq("/items/new")
  end

end
