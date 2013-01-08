class AbstractsController < ApplicationController
  def show
    @abstarct = Article.find(params[:article_id]).abstract
  end
end
