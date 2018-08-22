RSpec.describe 'Item create page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Beer World')
    @merchant_2 = Merchant.create(name: 'Wine World')
  end

  it 'should show item form heading' do
    visit "/items/new"
    expect(page).to have_content('Create New Item')
  end

  it 'should select merchant name from drop down menu' do
    visit "/items/new"
    select("Beer World", from: "merchant_dropdown")
  end

  it 'should fill in form with Item name' do
    visit "/items/new"
    fill_in('item[name]', with: "Delerium Tremens Beer")
  end

  it 'should fill in form with Item description' do
    visit "/items/new"
    fill_in('item[description]', with: "Pink Elephant")
  end

  it 'should fill in form with Item price' do
    visit "/items/new"
    fill_in('item[unit_price]', with: 14)
  end

  it 'should fill in form with Item image path' do
    visit "/items/new"
    fill_in('item[image]', with: "path_to_image")
  end

  it 'should link back to item index after Create button clicked' do
    visit "/items/new"

    select("Beer World", from: "merchant_dropdown")
    fill_in('item[name]', with: "Delerium Tremens Beer")
    fill_in('item[description]', with: "Pink Elephant")
    fill_in('item[unit_price]', with: 14)
    fill_in('item[image]', with: "path_to_image")

    click_on "Create Item"
    expect(current_path).to eq("/items")
  end

  it 'should link back to item index after Cancel button clicked' do
    visit "/items/new"

    click_on "Cancel"
    expect(current_path).to eq("/items")
  end

  it 'should show new item at index after Create button clicked' do
    visit "/items/new"

    fill_in('item[name]', with: "Abdulla's Shop")
    fill_in('item[description]', with: "Pink Elephant")
    fill_in('item[unit_price]', with: 14)
    fill_in('item[image]', with: "path_to_image")

    click_on "Create Item"

    expect(page).to have_content("Abdulla's Shop")
  end
end
