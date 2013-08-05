module SimpleSignIn
  class Engine < ::Rails::Engine
    isolate_namespace SimpleSignIn

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'simple_sign_in.initialize' do
      config.to_prepare do
        ActiveSupport.on_load(:action_controller) do
          include SimpleSignIn::ControllerMethods
        end
      end
    end

  end
end
