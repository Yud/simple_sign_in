require 'spec_helper'

describe "LoginFlow" do
  describe "user logs in successfully" do

    before do
      @login = ENV['SIMPLE_SIGN_IN_LOGIN']
      @pass = ENV['SIMPLE_SIGN_IN_PASSWORD']
    end

    it "displays error notice if login / password are incorrect" do
      visit "/"
      fill_in("Login", with: 'wrong')
      fill_in("Password", with: 'sss')
      click_button('Submit')
      page.should have_content('Incorrect login or password')
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

    it "can be overrided in a specific controller" do
      visit "/public"
      page.should have_content("Public")
    end

    it "can be completely turned off in certain environments" do
      ApplicationController.class_eval("@@simple_sign_in_envs ||= [:development]")
      visit "/"
      page.should have_content("Top Secret")
      ApplicationController.class_eval("@@simple_sign_in_envs = nil")
    end

  end
end
