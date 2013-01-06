class ArticlesController < ApplicationController

  respond_to :html

  before_filter :find_journal

  def new
    @article = @journal.articles.new
    @article.build_abstract
    3.times { @article.authors.build }
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    flash[:success] = 'Article created' if @article.update_attributes(params[:article])

    respond_with(@journal, @article)
  end

  def create
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

  private

  def find_journal
    @journal = Journal.find(params[:journal_id])
  end
end
