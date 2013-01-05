class ArticlesController < ApplicationController

  def new
    @journal = Journal.find(params[:journal_id])
    @article = @journal.articles.new

  end

  def create
    @journal = Journal.find(params[:journal_id])
    @article = @journal.articles.new(params[:article])
    if @article.save
      flash[:success] = 'Article created'
      redirect_to journal_article_path(@journal, @article)
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def index

  end
end
