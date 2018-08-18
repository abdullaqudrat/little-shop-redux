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
  it 'edit button should have link to merchant edit page' do
    visit "/merchants/#{@merchant_1.id}"

    click_on "Edit"

    expect(current_path).to eq("/merchants/#{@merchant_1.id}/edit")
  end
  it 'should not show deleted merchant at index after Delete button clicked' do

    visit "/merchants/#{@merchant_1.id}"

    click_on "Delete"

    expect(current_path).to eq("/merchants")
    expect(page).to_not have_content("Beer World")
  end
end
