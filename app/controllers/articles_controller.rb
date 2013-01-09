class ArticlesController < ApplicationController

  respond_to :html

  before_filter :find_journal

  def new
    @article = @journal.articles.new
    @article.build_abstract
    5.times { @article.authors.build }
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

    flash[:success] = 'Article created' if @article.save

    respond_with(@journal, @article)

  end
  
  def show
    @article = Article.find(params[:id])
  end

  def index

  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = 'Article deleted'
    respond_with (@journal)
  end

  def pdf
    send_file Article.find(params[:id]).pdf.url
  end

  private

  def find_journal
    @journal = Journal.find(params[:journal_id])
  end
end
