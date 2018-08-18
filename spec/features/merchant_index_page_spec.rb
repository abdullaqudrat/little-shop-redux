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

  it 'merchant name should have link to merchant new page' do
    visit '/merchants'
    click_on 'Create A New Merchant'
    expect(current_path).to eq("/merchants/new")
  end

  it 'merchant name should have link to merchant new page' do
    visit '/merchants'
    save_and_open_page
    click_on 'Edit'
    expect(current_path).to eq("/merchants/@merchant_1")
  end
  # it 'create new merchant button links to new page' do
  #   visit '/merchants'
  #   click_on
  #   expect(current_path).to eq("/merchants/new")
  # end
end
