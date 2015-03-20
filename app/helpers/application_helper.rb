module ApplicationHelper

  def full_title page_title
    base_title = "Framgia Book Reviewing System"
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(sort: column, direction: direction, page: nil), {class: css_class}
  end

  def logged_in_admin?
    user_signed_in? && current_user.role == "admin"
  end
end
