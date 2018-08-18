RSpec.describe 'Merchant Delete Page' do

  it 'should not show deleted merchant at index after Delete button clicked' do
    @merchant_1 = Merchant.create(name: 'Beer World')

    visit "/merchants"

    expect(page).to have_content("Beer World")

    within("#merchant-#{@merchant_1.id}-delete") do
      click_on "Delete"
    end

    expect(page).to_not have_content("Beer World")
  end

end
