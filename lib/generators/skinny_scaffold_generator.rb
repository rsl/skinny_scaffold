# # require 'rails/generators/erb/scaffold/scaffold_generator'

# class SkinnyScaffoldGenerator < Erb::Generators::ScaffoldGenerator
#   source_root File.expand_path('../templates', __FILE__)

#   def copy_view_files
#     available_views.each do |view|
#       filename = filename_with_extensions(view)
#       template filename_with_extensions(view, :erb), File.join('app/views', controller_file_path, filename_with_extensions(view))
#     end
#   end

# protected

#   def available_views
#     %w{index _form new edit}
#   end

#   def handler
#     :haml
#   end

#   def filename_with_extensions(name, local_handler = handler)
#     [name, format, local_handler].compact.join('.')
#   end

#   module TemplateMethods
#     def form_builder_method
#       return 'simple_form_for' if defined?(SimpleForm)
#       'form_for'
#     end

#     def plural_instance_variable
#       "@#{plural_table_name}"
#     end

#     def singular_instance_variable
#       "@#{singular_table_name}"
#     end

#     def table
#       ERB.new(table_partial).result binding
#     end

#     def table_source
#       return 'tabula_rasa_table' if !defined?(TabulaRasa)
#       'default_table'
#     end

#     def table_partial
#       filename = File.expand_path("lib/generators/skinny_scaffold/templates/partials/#{table_source}.html.erb")
#       File.read filename
#     end
#   end
#   include TemplateMethods
# end
