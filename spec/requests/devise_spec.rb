require 'rails_helper'

RSpec.describe '/users/sign_in', type: :request do
  include Devise::Test::IntegrationHelpers

  context "valid credentials" do
    before do 
      @user = create :user
    end
    
    it "correct credentials" do
      get new_user_session_url
      # binding.pry
      sign_in(@user)
      get books_url
      # sign_in user
      # redirect_to(books_url)
      # expect(response).to redirect_to(root_url)
      expect(response).to have_http_status(200)
    end
    
    it "incorrect credentials" do
      @user.email = 'abc@gmail.com'
      get new_user_session_url
      # post new_user_session_url, params: user.to_json
      sign_in(@user)
      get books_url
      # binding.pry
      expect(response).to have_http_status(401)
      # expect(response).to redirect_to(root_url)
    end
  end
end