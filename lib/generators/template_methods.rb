# Namespacing methods used exclusively in templates just for clarity
module TemplateMethods
  def form_builder_method
    return 'simple_form_for' if defined?(SimpleForm)
    'form_for'
  end

  def plural_instance_variable
    "@#{plural_table_name}"
  end

  def singular_instance_variable
    "@#{singular_table_name}"
  end

  def table
    ERB.new(table_partial).result binding
  end

  def table_source
    return 'tabula_rasa_table' if defined?(TabulaRasa)
    'default_table'
  end

  def table_partial
    filename = File.join(self.class.source_root, 'partials', "#{table_source}.html.erb")
    File.read File.expand_path(filename)
  end
end
