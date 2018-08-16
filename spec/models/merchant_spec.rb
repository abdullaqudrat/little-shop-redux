RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a title' do
      merchant = Merchant.create(name: "Beer World")

      expect(merchant).to be_valid
    end
  end
end
