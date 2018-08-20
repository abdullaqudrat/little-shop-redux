RSpec.describe 'Invoice show page' do
  before(:each) do
    @merchant = Merchant.create(name: 'Beer World')
    @invoice_1 = Invoice.create(merchant_id: 1, status: 'Pending')
    @invoice_2 = Invoice.create(merchant_id: 1, status: 'Returned')
  end

  it "should show invoice id" do
    visit "/invoices/#{@invoice_1.id}"
    expect(page).to have_content(@invoice_1.id)
  end

  it "should show invoice status" do
    visit "/invoices/#{@invoice_1.id}"
    expect(page).to have_content(@invoice_1.status)

    visit "/invoices/#{@invoice_2.id}"
    expect(page).to have_content(@invoice_2.status)
  end

  it "should show merchant name associated with invoice" do
    visit "/invoices/#{@invoice_1.id}"
    expect(page).to have_content(@merchant.name)
  end

  it 'merchant name should have link to merchant show page' do
    visit "/invoices/#{@invoice_1.id}"
    click_on @invoice_1.merchant.name

    expect(current_path).to eq("/merchants/#{@merchant.id}")
  end

  it 'edit button should have link to item edit page' do
    visit "/invoices/#{@invoice_1.id}"

    click_on "Edit"

    expect(current_path).to eq("/invoices/#{@invoice_1.id}/edit")
  end

  it 'should not show deleted item at index after Delete button clicked' do

    visit "/invoices/#{@invoice_1.id}"

    click_on "Delete"

    expect(current_path).to eq("/invoices")
    expect(page).to_not have_content(@invoice_1.id)
  end
end
