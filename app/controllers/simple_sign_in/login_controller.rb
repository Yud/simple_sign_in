require_dependency "simple_sign_in/application_controller"

module SimpleSignIn
  class LoginController < ApplicationController
    skip_before_filter :simple_sign_in_authentication, only: [:new, :create]

    def new
    end

    def create
      if params[:login] == ENV['SIMPLE_SIGN_IN_LOGIN'] && params[:password] == ENV['SIMPLE_SIGN_IN_PASSWORD']
        session[:simple_sign_in_admin] = ENV['SIMPLE_SIGN_IN_LOGIN']
        redirect_to "/"
      else
        flash[:notice] = 'Incorrect login or password'
        redirect_to :root
      end
    end

    def destroy
      session[:simple_sign_in_admin] = nil
      flash[:notice] = 'You have been signed out'
      redirect_to :root
    end
  end
end
