module SkinnyScaffoldHelper
  def skinny_scaffold_index_header(object)
    skinny_scaffold_object_name(object) + ' List'
  end

  def skinny_scaffold_form_header(object)
    object_name = skinny_scaffold_object_name(object)
    text = object.new_record? ? "Add #{object_name}" : "Edit #{object_name}"
    content_tag skinny_scaffold_header_tag, text
  end

private

  def skinny_scaffold_header_tag
    :h2
  end

  def skinny_scaffold_object_name(object)
    case object
    when ActiveRecord::Relation
      object.klass.table_name.humanize.titleize
    when ActiveRecord::Base
      object.human_name.titleize
    else
      raise "Cannot determine skinny_scaffold_object_name for #{object}: #{object.class}"
    end
  end
end
