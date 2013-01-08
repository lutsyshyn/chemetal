class AuthorsController < ApplicationController
  def create
    Article.find(params[:article_id]).authors.build.save
    redirect_to edit_journal_article_path(params[:journal_id],params[:article_id])
  end
end
