module SkinnyScaffold
  class Railtie < Rails::Railtie
    config.app_generators.template_engine :haml

    config.before_initialize do
      Haml.init_rails binding
      Haml::Template.options[:format] = :html5
    end
  end
end
