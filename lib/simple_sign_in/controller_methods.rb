module SimpleSignIn
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      before_filter :redirect_unless_logged_in
      @@simple_sign_in_envs = nil
    end

    def redirect_unless_logged_in
      redirect_to "/simple_sign_in" if !logged_in? && simple_sign_in_envs.include?(Rails.env.to_sym)
    end

    def simple_sign_in_envs
      @@simple_sign_in_envs || [:test, :development, :production]
    end

    private

      def logged_in?
        session[:simple_sign_in_admin] == ENV['SIMPLE_SIGN_IN_LOGIN']
      end

  end
end
