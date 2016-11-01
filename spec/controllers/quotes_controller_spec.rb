require 'rails_helper'


RSpec.describe QuotesController, type: :controller do
  describe 'quotes #create action' do
      it 'Should let users create quotes' do

      user = FactoryGirl.create(:user)
      quote = FactoryGirl.create(:quote)
    
      sign_in user
      post :create, quote_id: quote.id, quote: {citation: 'And then they fell'}
      expect(response).to redirect_to root_path
    end

   
end

end
