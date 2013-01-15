module ApplicationHelper

  def full_title(page_title)
    base_title = 'Chemistry of Metals and Alloys'
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end

  def all_journals
    Journal.all
  end

end
