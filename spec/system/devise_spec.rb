require 'rails_helper'

describe "user sign in", type: :system do
  
  before do
    @user = create :user
    get new_user_session_url
  end
  
  it "valid with correct credentials" do
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_button "sign_in"
    binding.pry

  end

end