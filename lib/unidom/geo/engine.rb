module Unidom
  module Geo

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace Unidom::Geo

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
