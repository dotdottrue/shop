require 'rails_helper'

describe Product do
	# setup
	product = FactoryGirl.build(:product)
  
  it 'returns the concatenated productname' do
    
    # excercise and verify
    expect(product.name).to eq 'Mein Produkt'
  end

  it 'returns the concatenated productdescription' do

    # excercise and verify
    expect(product.description).to eq 'Meine Beschreibung'
  end

end