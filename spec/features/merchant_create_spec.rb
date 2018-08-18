RSpec.describe 'Merchant create page' do

  it 'should show merchant form heading' do
    visit "/merchants/new"
    expect(page).to have_content('Create New Merchant')
  end

  it 'should fill in form with Merchant name' do
    visit "/merchants/new"
    fill_in('merchant[name]', with: "Abdulla's Shop")
  end

  it 'should link back to merchant index after Create button clicked' do
    visit "/merchants/new"

    click_on "Create Merchant"
    expect(current_path).to eq("/merchants")
  end

  it 'should link back to merchant index after Cancel button clicked' do
    visit "/merchants/new"

    click_on "Cancel"
    expect(current_path).to eq("/merchants")
  end

  it 'should show new merchant at index after Create button clicked' do
    @merchant_1 = Merchant.create(name: 'Beer World')

    visit "/merchants/new"

    fill_in('merchant[name]', with: "Abdulla's Shop")
    click_on "Create Merchant"
    expect(page).to have_content("Abdulla's Shop")
  end
end
