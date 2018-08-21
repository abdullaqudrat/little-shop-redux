RSpec.describe Invoice do
  describe 'Class Methods' do
    before(:each) do
    @invoice_1 = Invoice.create(merchant_id: 12346, status: "pending")
    @invoice_2 = Invoice.create(merchant_id: 12347, status: "pending")
    @invoice_3 = Invoice.create(merchant_id: 12348, status: "shipped")
    @invoice_4 = Invoice.create(merchant_id: 12349, status: "returned")

    @invoice_item_1 = InvoiceItem.create(item_id: 263765875, invoice_id: 12346, quantity: 1, unit_price: 13635)
    @invoice_item_2 = InvoiceItem.create(item_id: 263098765, invoice_id: 12346, quantity: 2, unit_price: 31324)
    @invoice_item_3 = InvoiceItem.create(item_id: 263123456, invoice_id: 12347, quantity: 4, unit_price: 52547)
    end

    describe '.status_percentage' do
      it 'can find invoice status as a percentage of total invoices' do
        percentage_shipped = Invoice.status_percentage("shipped")
        percentage_returned = Invoice.status_percentage("returned")
        percentage_pending = Invoice.status_percentage("pending")

        expect(percentage_shipped).to eq(25.0)
        expect(percentage_returned).to eq(25.0)
        expect(percentage_pending).to eq(50.0)
      end
    end

    describe '.highest_unit_price' do
      it "can find invoice with highest associated unit price" do
        expect(Invoice.highest_unit_price).to eq(@invoice_item_3.invoice_id)
      end
    end

    describe '.lowest_unit_price' do
      it "can find invoice with lowest associated unit price" do
        expect(Invoice.lowest_unit_price).to eq(@invoice_item_1.invoice_id)
      end
    end

    describe '.highest_quantity' do
      it "can find invoice with highest associated quantity" do
        expect(Invoice.highest_quantity).to eq(@invoice_item_3.invoice_id)
      end
    end

    describe '.lowest_quantity' do
      it "can find invoice with lowest associated quantity" do
        expect(Invoice.lowest_quantity).to eq(@invoice_item_1.invoice_id)
      end
    end
  end

  describe 'Validations' do
    it "has one merchant" do
      association = described_class.reflect_on_association(:merchant)
      expect(association.macro).to eq :belongs_to
    end

    it "has many invoice items" do
      association = described_class.reflect_on_association(:invoice_items)
      expect(association.macro).to eq :has_many
    end

    it "has many items" do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end

    it 'is valid with attributes' do
      invoice = Invoice.create(merchant_id: 12345, status: "pending")
      expect(invoice).to be_valid
    end

    it 'is invalid without a merchant_id' do
      invoice = Invoice.create(status: "pending")
      expect(invoice).to_not be_valid
    end

    it 'is invalid without a status' do
      invoice = Invoice.create(merchant_id: 12345)
      expect(invoice).to_not be_valid
    end
  end
end
