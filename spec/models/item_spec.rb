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

  describe 'Class Methods' do
    before(:each) do
      @item_1 = Item.create(name: "Zanti Red", description: "Red Wine", unit_price: 7, image: '../../public/images/capy-photo.jpg')
      @item_2 = Item.create(name: "Espinosa White", description: "White Wine", unit_price: 11, image: '../../public/images/capy-photo.jpg')
      @item_3 = Item.create(name: "McMahon Rose", description: "Rose Wine", unit_price: 15, image: '../../public/images/capy-photo.jpg')
    end
    describe '.total_count' do
      it 'returns total item count' do
        expect(Item.total_count).to eq(3)
      end
    end

    describe '.avg_price' do
      it 'calculates price of all items' do
        expect(Item.avg_price).to eq(11)
      end
    end

    describe '.newest_item' do
      it 'calculated newest item by age' do
        expect(Item.newest_item).to eq(@item_3.name)
      end
    end

    describe '.oldest_item' do
      it 'calculated oldest item by age' do
        expect(Item.oldest_item).to eq(@item_1.name)
      end
    end
  end
end
