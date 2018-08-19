RSpec.describe Merchant do
  describe 'Validations' do
    it "has many items" do
        association = Merchant.reflect_on_association(:items)
        expect(association.macro).to eq :has_many
      end
    it "has many invoices" do
        association = Merchant.reflect_on_association(:invoices)
        expect(association.macro).to eq :has_many
      end

    it 'is valid with a name' do
      merchant = Merchant.create(name: "Beer World")

      expect(merchant).to be_valid
    end

    it 'is invalid without a name' do
      merchant = Merchant.create

      expect(merchant).to_not be_valid
    end
  end
end
