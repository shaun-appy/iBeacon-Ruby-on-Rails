module Appy
  module Ibeacon
    class Engine < ::Rails::Engine
      isolate_namespace Appy::Ibeacon
      engine_name :appy_ibeacon
      
      # Autoloads files from lib folder
      config.autoload_paths += %W(#{config.root}/lib)

      #Defines the translation folder
      config.i18n.load_path += Dir[Engine.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
      config.i18n.default_locale = :en

      paths["app/views"] << "app/views/appy/ibeacon"

      if Gem.loaded_specs['appy_ibeacon']
        Gem.loaded_specs['appy_ibeacon'].dependencies.each do |d|
          require d.name
        end
      end

      initializer :append_migrations do |app|
        unless app.root.to_s.match(root.to_s)
          config.paths["db/migrate"].expanded.each do |p|
            app.config.paths["db/migrate"] << p
          end
        end
      end

      config.to_prepare do
        Dir.glob(Engine.root.join("app", "decorators", "**", "*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

    end

  end
end
