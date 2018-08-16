RSpec.describe 'Merchant create page' do

  it 'should show merchant name' do
    visit "/merchants/new"
    expect(page).to have_content('Create New Merchant')
  end

  it 'should fill in form with Merchant name' do
    visit "/merchants/new"
    fill_in('merchant[name]', with: "Abdulla's Shop")
  end
end
