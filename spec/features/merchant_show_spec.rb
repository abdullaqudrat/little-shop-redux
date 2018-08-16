RSpec.describe 'Merchant show page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Beer World')
  end

  context 'merchant show page' do
    it 'should show merchant name' do
      visit "/merchants/#{@merchant_1.id}"
      # expect(current_path).to eq("/merchants/#{@merchant_1.id}")
      expect(page).to have_content(@merchant_1.name)
    end
  end
end
