require 'spec_helper'

describe "LoginFlow" do
  describe "user logs in successfully" do

    before do
      @login = ENV['SIMPLE_SIGN_IN_LOGIN']
      @pass = ENV['SIMPLE_SIGN_IN_PASSWORD']
    end

    it "redirects the user to login screen where the user logs in", js: true do
      visit "/"
      fill_in("Login", with: @login)
      fill_in("Password", with: @pass)
      click_button('Submit')
      page.should have_content('Secret')
      click_link "Sign Out"
      page.should have_content('You have been signed out')
    end

  end
end
