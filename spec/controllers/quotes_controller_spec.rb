require 'rails_helper'



RSpec.describe QuotesController, type: :controller do
  describe 'quotes #create action' do
      it 'Should let users create quotes' do

      user = FactoryGirl.create(:user)
      quote = FactoryGirl.create(:quote)
    
      sign_in user
      post :create, quote_id: quote.id, quote: {citation: 'And then they fell'}, tag: 'word'
      expect(response).to redirect_to root_path
    end
  end

  describe 'quotes#new action' do
    it 'should require users to be signed in' do
      get :new 
      expect(response).to redirect_to new_user_session_path
    end

    it 'should successfully show sign in form' do
      user = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin)
      sign_in admin
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
