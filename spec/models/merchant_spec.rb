RSpec.describe Merchant do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Beer World')
    @item_1 = @merchant_1.items.create(name: "Turing Ale", description: "Beer", unit_price: 4, image: '../../public/images/capy-photo.jpg')
    @item_2 = @merchant_1.items.create(name: "Delerium Tremens", description: "Beer", unit_price: 12, image: '../../public/images/capy-photo.jpg')
    @merchant_2 = Merchant.create(name: 'Wine World')
    @item_3 = @merchant_2.items.create(name: "Turing Ale", description: "Beer", unit_price: 4, image: '../../public/images/capy-photo.jpg')
  end
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

  describe 'Class Methods' do
    describe 'most_items method' do
      it 'returns the merchant with most items' do

        expect(Merchant.with_most_items).to eq(@merchant_1)
      end
    end
    describe 'total_item_count method' do
      it 'returns the total item count for merchant' do

        expect(Merchant.total_item_count(@merchant_1.id)).to eq(2)
      end
    end
    describe 'average_item_price method' do
      it 'returns the average item price for merchant' do

        expect(Merchant.average_item_price(@merchant_1.id)).to eq(8)
      end
    end
    describe 'total_price_of_all_items method' do
      it 'returns the total price of all items for merchant' do

        expect(Merchant.total_price_of_all_items(@merchant_1.id)).to eq(16)
      end
    end
  end
end
