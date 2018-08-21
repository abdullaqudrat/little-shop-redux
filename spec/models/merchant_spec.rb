RSpec.describe Merchant do
  before(:each) do
    @merchant_1 = Merchant.create(name: 'Beer World')
    @item_1 = @merchant_1.items.create(name: "Turing Ale", description: "Beer", unit_price: 5, image: '../../public/images/capy-photo.jpg')
    @item_2 = @merchant_1.items.create(name: "Delerium Tremens", description: "Beer", unit_price: 11, image: '../../public/images/capy-photo.jpg')
    @merchant_2 = Merchant.create(name: 'Wine World')
    @item_3 = @merchant_2.items.create(name: "Turing Ale", description: "Beer", unit_price: 12, image: '../../public/images/capy-photo.jpg')
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

    describe 'total_item_count method' do
      it 'returns the total item count for merchant' do

        expect(@merchant_1.total_item_count).to eq(2)
      end
    end
    describe 'average_item_price method' do
      it 'returns the average item price for merchant' do

        expect(@merchant_1.average_item_price).to eq(8)
      end
    end
    describe 'total_price_of_all_items method' do
      it 'returns the total price of all items for merchant' do

        expect(@merchant_1.total_price_of_all_items).to eq(16)
      end
    end
    describe 'with_most_items method' do
      it 'returns the merchant with highest price item' do

        expect(Merchant.with_highest_price_item).to eq(@merchant_2.name)
      end
    end
  end
end
