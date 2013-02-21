class UserMailer < ActionMailer::Base
  default from: "test@chemetal-journal.org"
  default to: "yuri.lutsyshyn@gmail.com"

  def receipt_confirmation(user, article)
    @user = user
    @article = article
    mail(subject: "Article received")
  end

  def confirm_editor(user, article)
    @user = user
    @article = article
    mail(subject: "Please edit an article")
  end

  def confirm_reviewer(user, article)
    @user = user
    @article = article
    mail(subject: "Please review an article")
  end
end
