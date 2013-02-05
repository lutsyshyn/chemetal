class UserMailer < ActionMailer::Base
  default from: "test@chemetal-journal.org"
  default to: "yuri.lutsyshyn@gmail.com"

  def receipt_confirmation(user, article)
    @user = user
    @article = article
    mail(subject: "Article received")
  end
end
