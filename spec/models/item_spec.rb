RSpec.describe Item do
  describe 'Validations' do
    it "has many invoice items" do
      association = described_class.reflect_on_association(:invoice_items)
      expect(association.macro).to eq :has_many
    end
    it "has many invoices" do
      association = described_class.reflect_on_association(:invoices)
      expect(association.macro).to eq :has_many
    end
    it 'is valid with attributes' do
      item = Item.create(name: "Turing Ale", description: "Beer", unit_price: 12, image: 'pic_of_beer_here', merchant_id: 1)

      expect(item).to be_valid
    end

    it 'is invalid without a name' do
      item = Item.create(description: "Beer", unit_price: 12, image: 'pic_of_beer_here')

      expect(item).to_not be_valid
    end

    it 'is invalid without a description' do
      item = Item.create(name: "Turing Ale", unit_price: 12, image: 'pic_of_beer_here')

      expect(item).to_not be_valid
    end

    it 'is invalid without a price' do
      item = Item.create(name: "Turing Ale", description: "Beer", image: 'pic_of_beer_here')

      expect(item).to_not be_valid
    end

    it 'is invalid without a picture' do
      item = Item.create(name: "Turing Ale", description: "Beer", unit_price: 12)

      expect(item).to_not be_valid
    end
  end
end
