module SimpleSignIn
  class Engine < ::Rails::Engine
    isolate_namespace SimpleSignIn

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'simple_sign_in.initialize' do
      config.to_prepare do
        unless ENV['SIMPLE_SIGN_IN_LOGIN'] && ENV['SIMPLE_SIGN_IN_PASSWORD']
          puts <<-eos
            simple_sign_in login and password were not specified!
            please make sure that the environment variables SIMPLE_SIGN_IN_LOGIN and SIMPLE_SIGN_IN_PASSWORD
            have been set up as described here: https://github.com/Yud/simple_sign_in#installation
          eos
        end
        ActiveSupport.on_load(:action_controller) do
          include SimpleSignIn::ControllerMethods
        end
      end
    end

  end
end
