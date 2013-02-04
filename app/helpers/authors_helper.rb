module AuthorsHelper
  def authors_presenter(article)
    authors = []
    article.authors.each do |author|
      if author.email.present?
        authors << mail_to(author.email, author.name)
      else
        authors << author.name
      end
    end
    authors.join(", ").html_safe
  end
end
