RSpec.describe 'Merchant update page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Beer World')
  end

  it 'should show merchant name' do
    visit "/merchants/1/edit"
    expect(page).to have_content("Edit #{@merchant_1.name}")
  end

  it 'should fill in form with Merchant name' do
    visit "/merchants/1/edit"
    fill_in('merchant[name]', with: "Abdulla's Shop")
  end
end
