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
    if object.published?
      #'<span class="label label-success">Published</span>'
      '<button class="btn btn-mini btn-success" type="button">Published</button>'
    else
      #'<span class="label">Not Published</span>'
      '<button class="btn btn-mini" type="button">Not Published</button>'
    end
  end

  def visible_toggle_link_text(object)
    if object.visible?
      #'<span class="label label-success">Visible</span>'
      '<button class="btn btn-mini btn-success" type="button">Visible</button>'
    else
      #'<span class="label">Hidden</span>'
      '<button class="btn btn-mini" type="button">Hidden</button>'
    end
  end



end
