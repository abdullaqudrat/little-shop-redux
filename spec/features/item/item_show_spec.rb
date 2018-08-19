RSpec.describe 'Item show page' do
  before(:each) do
    @merchant = Merchant.create(name: 'Beer World')
    @item = @merchant.items.create(name: "Turing Ale", description: "Beer", unit_price: 12, image: '../../images/capy-photo.jpg')
  end

  it 'should show item name' do
    visit "/items/#{@item.id}"
    expect(page).to have_content(@item.name)
  end

  it 'should show item price' do
    visit "/items/#{@item.id}"
    expect(page).to have_content(@item.unit_price)
  end

  it 'should show item description' do
    visit "/items/#{@item.id}"
    expect(page).to have_content(@item.description)
  end

  it 'should show item image' do
    visit "/items/#{@item.id}"

    page.has_xpath?(@item.image)
  end

  it 'should show merchant associated with item' do
    visit "/items/#{@item.id}"
    expect(page).to have_content(@merchant.name)
  end

  it 'merchant name should have link to merchant show page' do
    visit "/items/#{@item.id}"
    click_on @item.merchant.name
    expect(current_path).to eq("/merchants/#{@merchant.id}")
  end

  it 'edit button should have link to item edit page' do
    visit "/items/#{@item.id}"

    click_on "Edit"

    expect(current_path).to eq("/items/#{@item.id}/edit")
  end

  it 'should not show deleted item at index after Delete button clicked' do

    visit "/items/#{@item.id}"

    click_on "Delete"

    expect(current_path).to eq("/items")
    expect(page).to_not have_content(@item.name)
  end
end
