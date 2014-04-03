require_relative 'template_methods.rb'

class SkinnyScaffoldGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers
  include TemplateMethods

  source_root File.expand_path('../templates', __FILE__)

  def create_view_folder
    empty_directory File.join("app/views", controller_file_path)
  end

  def copy_view_files
    available_views.each do |view|
      filename = filename_with_extensions(view)
      template filename_with_extensions(view, :erb), File.join('app/views', controller_file_path, filename_with_extensions(view))
    end
  end

protected

  def available_views
    %w{index _form new edit}
  end

  def format
    :html
  end

  def handler
    :haml
  end

  def filename_with_extensions(name, local_handler = handler)
    [name, format, local_handler].compact.join('.')
  end
end
