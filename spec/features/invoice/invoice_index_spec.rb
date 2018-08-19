RSpec.describe 'Invoice index page' do
  before(:each) do
    @merchant = Merchant.create(id: 7, name: "Fluffy Animal Store")
    @invoice_1 = Invoice.create(id: 77473839, merchant_id: 7, status: "shipped")
    @invoice_2 = Invoice.create(id: 99928775, merchant_id: 5, status: "pending")
  end

  it 'should show invoice heading' do
    visit '/invoices'
    expect(page).to have_content("Invoices")
  end

  it 'should show all invoice ids' do
    visit '/invoices'
    expect(page).to have_content(@invoice_1.id)
    expect(page).to have_content(@invoice_2.id)
  end

  it 'invoice id should have link to invoice show page' do
    visit '/invoices'
    click_on @invoice_1.id
    expect(current_path).to eq("/invoices/#{@invoice_1.id}")
  end

end
