module SimpleSignIn
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      before_filter :redirect_unless_logged_in
    end

    def redirect_unless_logged_in
      redirect_to "/simple_sign_in" unless logged_in?
    end

    private

      def logged_in?
        session[:simple_sign_in_admin] == ENV['SIMPLE_SIGN_IN_LOGIN']
      end

  end
end
