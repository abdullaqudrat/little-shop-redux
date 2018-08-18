RSpec.describe 'Item index page' do
  before(:each) do
    @item_1 = Item.create(name: "Turing Ale", description: "Beer", unit_price: 4, image: 'pic_of_beer_here')
    @item_2 = Item.create(name: "Delerium Tremens", description: "Beer", unit_price: 12, image: 'pic_of_beer_here')
  end
  it 'should show all item names' do
    visit '/items'
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
  end

  xit 'should show all item prices' do
    visit '/items'
    expect(page).to have_content(@item_1.unit_price)
    expect(page).to have_content(@item_2.unit_price)
  end

  xit 'should show all item images' do
    visit '/items'
    expect(page).to have_content(@item_1.image)
    expect(page).to have_content(@item_2.image)
  end

  xit 'item name should have link to item show page' do
    visit '/items'
    click_on @item_1.name
    expect(current_path).to eq("/items/#{@item_1.id}")
  end

  xit 'item index should have link to item create page' do
    visit '/items'
    click_on 'Create A New Item'
    expect(current_path).to eq("/items/new")
  end

  xit 'item name should have link to item edit page' do
    visit '/items'
    within("#item-#{@item_1.id}-edit") do
      click_on "Edit"
    end
    expect(current_path).to eq("/items/#{@item_1.id}/edit")
  end

  xit 'should not show deleted item at index after Delete button clicked' do

    visit "/items"

    expect(page).to have_content("Beer World")

    within("#item-#{@item_1.id}-delete") do
      click_on "Delete"
    end

    expect(page).to_not have_content("Beer World")
  end
end
