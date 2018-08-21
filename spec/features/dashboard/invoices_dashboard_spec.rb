RSpec.describe 'Invoice Dashboard Page' do
  before(:each) do
    @invoice_1 = Invoice.create(merchant_id: 12346, status: "pending")
    @invoice_2 = Invoice.create(merchant_id: 12347, status: "pending")
    @invoice_3 = Invoice.create(merchant_id: 12348, status: "shipped")
    @invoice_4 = Invoice.create(merchant_id: 12349, status: "returned")

    @invoice_item_1 = InvoiceItem.create(item_id: 263765875, invoice_id: 12346, quantity: 1, unit_price: 13635)
    @invoice_item_2 = InvoiceItem.create(item_id: 263098765, invoice_id: 12346, quantity: 2, unit_price: 31324)
    @invoice_item_3 = InvoiceItem.create(item_id: 263123456, invoice_id: 12347, quantity: 4, unit_price: 52547)
  end

  it 'should show invoice dashboard heading' do
    visit '/invoices-dashboard'
    expect(page).to have_content("Invoices Dashboard")
  end

  it 'should show status percentages' do
    visit '/invoices-dashboard'
    expect(page).to have_content("Pending: #{Invoice.status_percentage("pending")}%")
    expect(page).to have_content("Shipped: #{Invoice.status_percentage("shipped")}%")
    expect(page).to have_content("Returned: #{Invoice.status_percentage("returned")}%")
  end

  it 'should show unit prices highest and lowest' do
    visit '/invoices-dashboard'
    expect(page).to have_content("#{Invoice.highest_unit_price}")
    expect(page).to have_content("#{Invoice.lowest_unit_price}")
  end

  it 'should show quantity prices highest and lowest' do
    visit '/invoices-dashboard'
    expect(page).to have_content("#{Invoice.highest_quantity}")
    expect(page).to have_content("#{Invoice.lowest_quantity}")
  end

end
