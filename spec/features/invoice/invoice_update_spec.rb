RSpec.describe 'Invoice update page' do
  before(:each) do
    @invoice = Invoice.create(merchant_id: 1, status: 'Pending')
    @merchant_1 = Merchant.create(name: "Wine World")
  end

  it 'should show invoice id' do
    visit "/invoices/#{@invoice.id}/edit"

    expect(page).to have_content("Invoice: #{@invoice.id}")
  end

  xit 'should show invoice status' do
    visit "/invoices/#{@invoice.id}/edit"

    expect(page).to have_content("#{@invoice.status}")
  end

  xit 'should select status from drop down menu' do
    visit "/invoices/#{@invoice.id}/edit"

    select("Returned", from: "status_dropdown")
  end

  xit 'cancels form when user clicks cancel button and goes to show page' do
    visit "/invoices/#{@invoice.id}/edit"
    click_on 'Cancel'

    expect(current_path).to eq("/invoices/#{@invoice.id}")
  end

  xit 'should link to item show after Update button clicked' do
    visit "/invoices/#{@invoices.id}/edit"

    click_on "Update Invoice"
    expect(current_path).to eq("/invoices/#{@invoices.id}")
  end

  xit 'should show updated item at show page after Update button clicked' do

    visit "/invoices/#{@invoice.id}/edit"

    select("Returned", from: "status_dropdown")
    click_on "Update Item"

    expect(page).to have_content("Returned")
  end
end
