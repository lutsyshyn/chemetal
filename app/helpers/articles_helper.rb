module ArticlesHelper
  def proofed_label(article)
    if article.proofed?
      '<span class="label label-success">Proofed</span>'
    else
      '<span class="label label-important">Not Proofed</span>'
    end
    end

  def received_label(article)
    if article.locked?
      '<span class="label label-success">Receipt Sent</span>'
    else
      '<span class="label label-important">Receipt not Sent</span>'
    end
    end

  def editor_label(article)
    if article.editor.present?
      "<span class='label label-success'>#{article.editor.email}</span>"
    else
      '<span class="label label-important">Editor not assigned</span>'
    end
  end
end
