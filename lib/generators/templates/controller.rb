<% module_namespacing do -%>
class <%= class_name %>Controller < ApplicationController
  <%= controller_before_filter %> :set_<%= file_name %>, only: [:edit, :update, :destroy]

  def index
    <%= plural_instance_variable %> = <%= orm_class.all(class_name) %>
    respond_with <%= plural_instance_variable %>
  end
<% end -%>