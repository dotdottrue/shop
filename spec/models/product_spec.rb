require 'rails_helper'

describe Product do
  # setup
  product = FactoryGirl.build(:product)
  
  it 'returns the concatenated product name' do
    
    # excercise and verify
    expect(product.name).to eq 'Mein Produkt'
  end

  it 'returns the concatenated product description' do

    # excercise and verify
    expect(product.description).to eq 'Meine Beschreibung'
  end

  it 'returns the concatenated product price' do
    examplePrice = BigDecimal.new('9.99') 
    # excercise and verify
    expect(product.price).to eq examplePrice
  end

end