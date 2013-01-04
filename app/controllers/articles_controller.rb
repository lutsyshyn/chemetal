class ArticlesController < ApplicationController

  def new
    @article = Journal.find(params[:id]).articles.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:success] = 'Article created'
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end

end
