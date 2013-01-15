class AbstractsController < ApplicationController

  before_filter :set_variables

  def show
  end

  def set_variables
    @journal = Journal.find(params[:journal_id])
    @article = Article.find(params[:article_id])
    @abstarct = @article.abstract
  end
end
