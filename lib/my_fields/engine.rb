module MyAuth

  class Engine < Rails::Engine

    initializer "my_fields.load_app_instance_data" do |app|
      MyAuth.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "my_fields.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end

end