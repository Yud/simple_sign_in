module SimpleSignIn
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      before_filter :simple_sign_in_authentication
      @@simple_sign_in_envs ||= nil
    end

    def simple_sign_in_authentication
      redirect_to "/simple_sign_in" if !simple_sign_in_user_logged_in? && authentication_is_on?
    end

    def simple_sign_in_envs
      @@simple_sign_in_envs || [:test, :development, :production]
    end

    def simple_sign_in_user_logged_in?
      session[:simple_sign_in_admin] == ENV['SIMPLE_SIGN_IN_LOGIN']
    end

    private

      def authentication_is_on?
        simple_sign_in_envs.include?(Rails.env.to_sym)
      end

  end
end
