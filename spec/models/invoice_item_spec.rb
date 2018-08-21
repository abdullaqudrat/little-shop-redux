RSpec.describe InvoiceItem do
  describe 'Validations' do
    it "has one item" do
      association = described_class.reflect_on_association(:item)
      expect(association.macro).to eq :belongs_to
    end

    it "has one invoice" do
      association = described_class.reflect_on_association(:invoice)
      expect(association.macro).to eq :belongs_to
    end

    it 'is valid with attributes' do
      invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 3, unit_price: 4)

      expect(invoice_item).to be_valid
    end

    it 'is invalid without a item_id' do
      invoice_item = InvoiceItem.create(invoice_id: 2, quantity: 3, unit_price: 4)

      expect(invoice_item).to_not be_valid
    end

    it 'is invalid without a invoice_id' do
      invoice_item = InvoiceItem.create(item_id: 1, quantity: 3, unit_price: 4)

      expect(invoice_item).to_not be_valid
    end

    it 'is invalid without a quantity' do
      invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 2, unit_price: 4)

      expect(invoice_item).to_not be_valid
    end

    it 'is invalid without a unit price' do
      invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 3)

      expect(invoice_item).to_not be_valid
    end
  end
end
