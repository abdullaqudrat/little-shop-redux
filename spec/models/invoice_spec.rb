RSpec.describe Invoice do
  describe 'Validations' do
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
