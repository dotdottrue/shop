require 'rails_helper'

# RSpec.describe 'Sign in' do
#   context 'existing user' do
#     let!(:login_user) { FactoryGirl.create(:user) }

#     it 'allows to sing in' do
#       visit root_path
#       sign_in login_user
#       page.should have_content login_user.email
#     end
#  end

describe 'POST #create' do
  context 'when password is invalid' do
    it 'renders the page with error' do
      user = create(:user)

      post :create, session: { email: user.email, password: 'invalid' }

      expect(response).to render_template(:new)
      expect(flash[:notice]).to match(/^Email and password do not match/)
    end
  end
end