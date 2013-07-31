module SimpleSignIn
  class Engine < ::Rails::Engine
    isolate_namespace SimpleSignIn

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'simple_sign_in.initialize' do
      config.to_prepare do
        unless ENV['SIMPLE_SIGN_IN_LOGIN'] && ENV['SIMPLE_SIGN_IN_PASSWORD']
          raise 'simple_sign_in could not be loaded because login and password were not specified!'
        end
        ActiveSupport.on_load(:action_controller) do
          include SimpleSignIn::ControllerMethods
        end
      end
    end

  end
end
