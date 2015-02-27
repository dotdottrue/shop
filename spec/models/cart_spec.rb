require 'rails_helper'

describe Cart do

	# setup
	cart = FactoryGirl.build(:cart)
  
  it 'returns the concatenated cart date' do
    
    # excercise and verify
    expect(cart.created_at).to eq DateTime.new(2001,2,3)
  end

  it 'returns the concatenated cart update date' do
    
    # excercise and verify
    expect(cart.updated_at).to eq DateTime.new(2001,2,4)
  end

  it 'returns the concatenated default value for the payment_id' do
    
    # excercise and verify
    expect(cart.payment_id).to eq 1
  end

  it 'returns the concatenated default value for the shipping_method_id' do
    
    # excercise and verify
    expect(cart.shipping_method_id).to eq 1
  end

  it 'returns the concatenated default value for the optional_invoice_address' do
    
    # excercise and verify
    expect(cart.optional_invoice_address).to eq false
  end

end