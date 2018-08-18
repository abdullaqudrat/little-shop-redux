RSpec.describe 'Item show page' do
  before(:each) do
    @item_1 = Item.create(name: "Turing Ale", description: "Beer", unit_price: 12, image: 'pic_of_beer_here')
    @merchant_1 = @item_1.merchants.create(name: 'Beer World')
  end

  it 'should show item name' do
    visit "/items/#{@item_1.id}"
    expect(page).to have_content(@item_1.name)
  end

  xit 'should show item price' do
    visit "/items/#{@item_1.id}"
    expect(page).to have_content(@item_1.unit_price)
  end

  xit 'should show item description' do
    visit "/items/#{@item_1.id}"
    expect(page).to have_content(@item_1.description)
  end

  xit 'should show item image' do
    visit "/items/#{@item_1.id}"
    expect(page).to have_content(@item_1.image)
  end

  xit 'should show merchant associated with item' do
    visit "/items/#{@item_1.id}"
    expect(page).to have_content(@merchant_1.name)
  end

  xit 'merchant name should have link to merchant show page' do
    visit '/items/#{@item_1.id}'
    click_on @merchant_1.name
    expect(current_path).to eq("/merchants/#{@merchant_1.id}")
  end

  xit 'edit button should have link to item edit page' do
    visit "/items/#{@item_1.id}"

    click_on "Edit"

    expect(current_path).to eq("/items/#{@item_1.id}/edit")
  end
  xit 'should not show deleted item at index after Delete button clicked' do

    visit "/items/#{@item_1.id}"

    click_on "Delete"

    expect(current_path).to eq("/items")
    expect(page).to_not have_content(@item_1.name)
  end
end
