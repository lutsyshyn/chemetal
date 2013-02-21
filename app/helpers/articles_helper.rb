module ArticlesHelper

  def status_label(object, methods, true_text, false_text)
    if object.send(methods).present?
      "<span class='label label-success'>#{true_text}</span>"
    else
      "<span class='label label-important'>#{false_text}</span>"
    end
  end

end
