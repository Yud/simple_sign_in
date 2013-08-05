require_dependency "simple_sign_in/application_controller"

module SimpleSignIn
  class LoginController < ApplicationController
    skip_before_filter :simple_sign_in_authentication, except: [:destroy]
    before_filter :raise_missing_environment_variables_error
    before_filter :redirect_to_root_if_user_is_logged_in, except: [:destroy]

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

    private
      def raise_missing_environment_variables_error
        unless ENV['SIMPLE_SIGN_IN_LOGIN'] && ENV['SIMPLE_SIGN_IN_PASSWORD']
          raise <<-eos
            simple_sign_in login and password were not specified!
            please make sure that the environment variables SIMPLE_SIGN_IN_LOGIN and SIMPLE_SIGN_IN_PASSWORD
            have been set up as described here: https://github.com/Yud/simple_sign_in#installation
          eos
        end
      end

      def redirect_to_root_if_user_is_logged_in
        redirect_to "/" if simple_sign_in_user_logged_in?
      end
  end
end
