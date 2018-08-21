RSpec.describe 'Invoice Dashboard Page' do
  before(:each) do
    @invoice_1 = Invoice.create(merchant_id: 12346, status: "pending")
    @invoice_2 = Invoice.create(merchant_id: 12347, status: "pending")
    @invoice_3 = Invoice.create(merchant_id: 12348, status: "shipped")
    @invoice_4 = Invoice.create(merchant_id: 12349, status: "returned")
  end

  it 'should show invoice dashboard heading' do
    visit '/invoices-dashboard'
    expect(page).to have_content("Invoices Dashboard")
  end

  it 'should show status percentages' do
    visit '/invoices-dashboard'
    save_and_open_page

    expect(page).to have_content("Pending: #{Invoice.status_percentage("pending")}%")
    expect(page).to have_content("Shipped: #{Invoice.status_percentage("shipped")}%")
    expect(page).to have_content("Returned: #{Invoice.status_percentage("returned")}%")
  end

end
