RSpec.describe 'Invoice update page' do
  before(:each) do
    @invoice_1 = Invoice.create(merchant_id: 1, status: 'Pending')
    @invoice_2 = Invoice.create(merchant_id: 1, status: 'Returned')
    @merchant_1 = Merchant.create(name: "Wine World")
  end

  it 'should show invoice id' do
    visit "/invoices/#{@invoice_1.id}/edit"
save_and_open_page
    expect(page).to have_content("Invoice: #{@invoice_1.id}")
  end

  it 'should show invoice status' do
    visit "/invoices/#{@invoice_1.id}/edit"

    expect(page).to have_content("#{@invoice_1.status}")
  end

  xit 'should select status from drop down menu' do
    visit "/invoices/#{@invoice_1.id}/edit"

    select("Returned", from: "status_dropdown")
  end

  xit 'cancels form when user clicks cancel button and goes to show page' do
    visit "/invoices/#{@invoice_1.id}/edit"
    click_on 'Cancel'

    expect(current_path).to eq("/invoices/#{@invoice_1.id}")
  end

  xit 'should link to invoice show after Update button clicked' do
    visit "/invoices/#{@invoice_1.id}/edit"

    click_on "Update Invoice"
    expect(current_path).to eq("/invoices/#{@invoice_1.id}")
  end

  xit 'should show updated invoice at show page after Update button clicked' do

    visit "/invoices/#{@invoice_1.id}/edit"

    select("Returned", from: "status_dropdown")
    click_on "Update Invoice"

    expect(page).to have_content("Returned")
  end
end
