RSpec.describe 'Item update page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: "Wine World")
    @merchant_2 = Merchant.create(name: "Beer World")
    @item_1 = @merchant_1.items.create(name: "Turing Ale", description: "Beer", unit_price: 4, image: '../../images/capy-photo.jpg')
  end

  it 'should show item name' do
    visit "/items/#{@item_1.id}/edit"
    expect(page).to have_content("Edit #{@item_1.name}")
  end

  it 'should select merchant name from drop down menu' do
    visit "/items/#{@item_1.id}/edit"
    select("Wine World", from: "merchant_dropdown")
  end

  it 'should fill in form with Item name' do
    visit "/items/#{@item_1.id}/edit"
    fill_in('item[name]', with: "Delerium Tremens Beer")
  end

  it 'should fill in form with Item description' do
    visit "/items/#{@item_1.id}/edit"
    fill_in('item[description]', with: "Pink Elephant")
  end

  it 'should fill in form with Item price' do
    visit "/items/#{@item_1.id}/edit"
    fill_in('item[unit_price]', with: 14)
  end

  it 'should fill in form with Item image path' do
    visit "/items/#{@item_1.id}/edit"
    fill_in('item[image]', with: "path_to_image")
  end

  it 'cancels form when user clicks cancel button and goes to show page' do
    visit "/items/#{@item_1.id}/edit"
    click_on 'Cancel'
    expect(current_path).to eq("/items/#{@item_1.id}")
  end

  it 'should link to item show after Update button clicked' do
    visit "/items/#{@item_1.id}/edit"

    click_on "Update Item"
    expect(current_path).to eq("/items/#{@item_1.id}")
  end

  it 'should show updated item at show page after Update button clicked' do

    visit "/items/#{@item_1.id}/edit"

    select("Wine World", from: "merchant_dropdown")
    fill_in('item[name]', with: "Delerium Tremens Beer")
    fill_in('item[description]', with: "Pink Elephant")
    fill_in('item[unit_price]', with: 14)
    fill_in('item[image]', with: "path_to_image")
    click_on "Update Item"

    expect(page).to have_content("Delerium Tremens Beer")
    expect(page).to have_content("Pink Elephant")
    expect(page).to have_content("14")
    page.has_xpath?('path_to_image')
  end
end
