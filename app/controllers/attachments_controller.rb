class AttachmentsController < ApplicationController
  def create
    redirect_to edit_journal_article_path(params[:journal_id],params[:article_id])
  end
end
