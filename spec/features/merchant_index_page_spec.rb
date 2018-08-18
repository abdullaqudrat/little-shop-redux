RSpec.describe 'Merchant index page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Beer World')
    @merchant_2 = Merchant.create(name: 'Wine World')
  end
  context 'shows merchant name' do
    it 'should show all merchant names' do
      visit '/merchants'
      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end
  end

  it 'merchant name should have link to merchant show page' do
    visit '/merchants'
    click_on @merchant_1.name
    expect(current_path).to eq("/merchants/#{@merchant_1.id}")
  end

  it 'merchant index should have link to merchant create page' do
    visit '/merchants'
    click_on 'Create A New Merchant'
    expect(current_path).to eq("/merchants/new")
  end

  it 'merchant name should have link to merchant edit page' do
    visit '/merchants'
    within("#merchant-#{@merchant_1.id}-edit") do
      click_on "Edit"
    end
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/edit")
  end
  it 'should not show deleted merchant at index after Delete button clicked' do

    visit "/merchants"
    
    expect(page).to have_content("Beer World")

    within("#merchant-#{@merchant_1.id}-delete") do
      click_on "Delete"
    end

    expect(page).to_not have_content("Beer World")
  end
end
