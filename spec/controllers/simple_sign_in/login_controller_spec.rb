require 'spec_helper'

module SimpleSignIn
  describe SimpleSignIn::LoginController do
    before do
      @login = ENV['SIMPLE_SIGN_IN_LOGIN']
      @pass = ENV['SIMPLE_SIGN_IN_PASSWORD']
    end

    describe "GET 'new'" do
      it "returns http success" do
        get 'new', use_route: SimpleSignIn
        response.should be_success
      end

      it "should redirect to root if the user is already logged in" do
        session['simple_sign_in_admin'] = @login
        get 'new', use_route: SimpleSignIn
        response.should redirect_to "/"
      end
    end

    describe "POST 'create'" do
      it "should redirect to the app's root if login was successfull" do
        session[:simple_sign_in_admin].should be_nil
        post 'create', login: @login, password: @pass, use_route: SimpleSignIn
        session[:simple_sign_in_admin].should == @login
        response.should redirect_to "/"
      end

      it "should display an error message if the login/password were incorrect" do
        post 'create', login: '', password: '', use_route: SimpleSignIn
        response.should redirect_to :root
        session[:simple_sign_in_admin].should be_nil
        flash[:notice].should == "Incorrect login or password"
      end

      it "should redirect to root if the user is already logged in" do
        session['simple_sign_in_admin'] = @login
        post 'create', login: @login, password: @pass, use_route: SimpleSignIn
        response.should redirect_to "/"
      end
    end

    describe "DELETE 'destroy'" do
      it "should sign out the user" do
        session[:simple_sign_in_admin] = @login
        delete 'destroy', use_route: SimpleSignIn
        session[:simple_sign_in_admin].should be_nil
        response.should redirect_to :root
      end
    end

    it "should raise an error if environment variables are nil" do
      ENV['SIMPLE_SIGN_IN_LOGIN'] = nil
      expect { get 'new', use_route: SimpleSignIn }.to raise_error
      expect { post 'create', login: '', password: '', use_route: SimpleSignIn }.to raise_error
      ENV['SIMPLE_SIGN_IN_LOGIN'] = @login
    end 
  end
end
