RSpec.describe 'Merchant create page' do

  it 'should show merchant name' do
    visit "/merchants/new"
    expect(page).to have_content('Create New Merchant')
  end
end
