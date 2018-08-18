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
  it 'cancels form when user clicks cancel button and goes to show page' do
    visit "/merchants/#{@merchant_1.id}/edit"
    click_link('Cancel')
    expect(current_path).to eq("/merchants/#{@merchant_1.id}")
  end
end
