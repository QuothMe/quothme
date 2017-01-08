require 'rails_helper'


RSpec.describe QuotesController, type: :controller do
  describe "quotes#create action" do
  		it 'requires users to be logged in' do
  			post :create, 
  			quote: {citation: 'shlalom',
  			image: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/buscemi.png')
  			}
  			expect(response).to redirect_to new_user_session_path
  		end

		it 'allows users to create quotes' do
			user = FactoryGirl.create(:user)
			sign_in user
			expect{
			post :create,  quote: FactoryGirl.attributes_for(:quote)}.to change(Quote, :count).by(1)
				
		end
	end

		
  describe 'quotes#index action' do
  	it 'renders quotes index for authenticated users' do
  		user = FactoryGirl.create(:user)
  		sign_in user

  		get :index
  		expect(response).to have_http_status(:success)
 	end
 end

 describe 'quotes#edit action' do
 	it "doesn't let unauthenticated users edit a quote"do
	 	quote = FactoryGirl.create(:quote)
	 	get :edit, id:quote.id
	 	expect(response).to redirect_to new_user_session_path

 	end

 	it 'successfully shows the edit form if the quote is found' do
 		quote = FactoryGirl.create(:quote)
 		sign_in quote.user
 		get :edit, id: quote.id
 		expect(response).to have_http_status(:success)
 	end
 end

 	describe 'quotes#update action' do
 		it "doesn't let unauthenticated users create a quote" do
 			quote = FactoryGirl.create(:quote)

 			patch :update, id: quote.id, quote:{citation: 'Shalom'}
 			expect(response).to redirect_to new_user_session_path
 		end

 		it 'allows users to successfully update quote' do
 			quote = FactoryGirl.create(:quote, citation: 'the old text')
 			sign_in quote.user
 			patch :update, id: quote.id, quote:{ citation: 'the new text'}
 			expect(response).to redirect_to root_path
 			quote.reload
 			expect(quote.citation).to eq 'the new text'
 		end

 	end

 	describe 'quotes#destroy action'do
 		it "doesn't allow unauthenticated users destroy a quote" do
 			quote = FactoryGirl.create(:quote)
 			delete :destroy, id: quote.id
 			expect(response).to redirect_to new_user_session_path
 		end

 		it 'returns a 404 message is quote is not found by id specified' do
 			user = FactoryGirl.create(:user)
 			sign_in user
 			delete :destroy, id: 'None'
 			expect(response).to have_http_status(:not_found)
 		end

 		it "allows a user to destroy a quote" do
 			quote = FactoryGirl.create(:quote)
 			sign_in quote.user
 			delete :destroy, id: quote.id
 			expect(response). to redirect_to root_path
 			quote = Quote.find_by_id(quote.id)
 			expect(quote).to eq nil
 		end
 	end


    

end
