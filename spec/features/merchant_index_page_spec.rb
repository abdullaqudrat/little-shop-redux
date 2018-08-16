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

end
