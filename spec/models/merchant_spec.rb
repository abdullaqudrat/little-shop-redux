RSpec.describe Merchant do
  describe 'Validations' do
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
