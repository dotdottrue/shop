require 'rails_helper'

# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User, '#name' do
  it 'returns the concatenated first and last name' do
    # setup
    # user = build(:user, firstname: 'Josh', lastname: 'Steiner')
    user = FactoryGirl.build(:user)

    # excercise and verify
    expect(user.firstname).to eq 'Tobias'
    expect(user.lastname).to eq 'Kappert'
  end
end
