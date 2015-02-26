require 'rails_helper'

# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User, '#name' do
  it 'returns the concatenated first and last name' do
    # setup
    user = FactoryGirl.build(:user)

    # excercise and verify
    expect(user.firstname).to eq 'Tobias'
    expect(user.lastname).to eq 'Kappert'
  end

  it 'returns the concatenated password' do
    # setup
    user = FactoryGirl.build(:user)

    # excercise and verify
    expect(user.password).to eq 'tk12345678'
  end

  it 'returns the concatenated email' do
    # setup
    user = FactoryGirl.build(:user)

    # excercise and verify
    expect(user.email).to eq 'tk@yahoo.de'
  end


end
