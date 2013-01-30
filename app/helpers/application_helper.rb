module ApplicationHelper

  def full_title(page_title)
    base_title = 'Chemistry of Metals and Alloys'
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end

  def publish_toggle_link_text(object)
    object.published? ? "Unpublish" : "Publish"
  end
  def visible_toggle_link_text(object)
    object.visible? ? "Hide" : "Show"
  end


end
