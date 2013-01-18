class AbstractsController < ApplicationController

  before_filter :set_variables

  def show
  end

  def set_variables
    @article = Article.find(params[:article_id])
    @abstract = @article.abstract
  end
end
