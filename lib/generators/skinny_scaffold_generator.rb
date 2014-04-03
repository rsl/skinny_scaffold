require_relative 'template_methods.rb'

class SkinnyScaffoldGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers
  include TemplateMethods

  source_root File.expand_path('../templates', __FILE__)

  def initialize(*args)
    super
  end

  def copy_controller_file
    template 'controller.rb', controller_filename_with_path
  end

  def handle_helper_file
    behavior == :invoke ? do_copy_helper_file : dont_remove_helper_file
  end

  def create_view_folder
    empty_directory File.join('app/views', controller_file_path)
  end

  def copy_view_files
    available_views.each do |view|
      template view_filename_with_extensions(view, :erb),
        File.join('app/views', controller_file_path, view_filename_with_extensions(view))
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

  def controller_filename_with_path
    File.join('app/controllers', "#{controller_name}_controller.rb")
  end

  def view_filename_with_extensions(name, local_handler = handler)
    [name, format, local_handler].compact.join('.')
  end

  def helper_filename_with_path
    'app/helpers/skinny_scaffold_helper.rb'
  end

  def do_copy_helper_file
    return if File.exists?(helper_filename_with_path)
    say_status 'NOTE >>>', 'Helper file will only be created once and will need to be removed manually!', :yellow
    copy_file 'helper.rb', helper_filename_with_path
  end

  def dont_remove_helper_file
    return unless File.exists?(helper_filename_with_path)
    say_status 'NOTE >>>', 'Helper file must be removed manually to prevent destruction of customizations!', :yellow
  end
end
