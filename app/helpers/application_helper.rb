module ApplicationHelper
  def sortable(column, class_name, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, root_path( :sort => column, :direction => direction, :class_name => class_name ), {:class => css_class}
  end
end
