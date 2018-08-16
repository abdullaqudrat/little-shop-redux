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
    save_and_open_page
    expect(current_path).to eq("/merchants/#{@merchant_1.id}")
  end
end
