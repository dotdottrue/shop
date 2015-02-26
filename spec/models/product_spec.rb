require 'rails_helper'


describe Product, '#name' do
  it 'returns the concatenated name, description, price, vat_rate and short_discription' do
    # setup
    product = FactoryGirl.build(:product)

    # excercise and verify
    expect(product.name).to eq 'MyString'
    expect(product.description).to eq 'MyText'
    expect(product.price).to eq 9.99
    expect(product.vat_rate).to eq 9.99
    expect(product.short_description).to eq 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  end


  it 'returns the concatenated name' do
    # setup
    product = FactoryGirl.build(:product)

    # excercise and verify
    expect(product.name).to eq 'MyString'
  end

  it 'returns the concatenated vat_rate' do
    # setup
    product = FactoryGirl.build(:product)

    # excercise and verify
    expect(product.vat_rate).to eq 9.99
  end

  it 'returns the concatenated price' do
    # setup
    product = FactoryGirl.build(:product)

    # excercise and verify
    expect(product.price).to eq 9.99
  end

end