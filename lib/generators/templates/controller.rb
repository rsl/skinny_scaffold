<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= file_name %>, only: [:edit, :update, :destroy]
  respond_to :html

  def index
    <%= plural_instance_variable %> = <%= class_name %>.all
    respond_with <%= plural_instance_variable %>
  end

  def new
    <%= singular_instance_variable %> = <%= class_name %>.new
    respond_with <%= singular_instance_variable %>
  end

  def create
    <%= singular_instance_variable %> = <%= class_name %>.create(<%= file_name %>_params)
    respond_with <%= singular_instance_variable %>
  end

  def edit
    # Render
  end

  def update
    <%= singular_instance_variable %>.update <%= file_name %>_params
    respond_with <%= singular_instance_variable %>
  end

  def destroy
    <%= singular_instance_variable %>.destroy
    respond_with <%= singular_instance_variable %>
  end

private

  def set_<%= file_name %>
    <%= singular_instance_variable %> = <%= class_name %>.find(params[:id])
  end

  def <%= file_name %>_params
    params.require(:<%= file_name %>).permit <%= file_name %>_attributes_whitelist
  end

  def <%= file_name %>_attributes_whitelist
    []
  end
end
<% end -%>