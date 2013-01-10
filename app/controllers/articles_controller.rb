class ArticlesController < ApplicationController

  respond_to :html

  before_filter :find_journal

  def new
    @article = @journal.articles.new
    @article.build_abstract
    5.times { @article.authors.build }
    3.times { @article.attachments.build }
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

  def full_pdf
    send_file Attachment.find_by_article_id_and_extension_and_description(params[:id], 'pdf', '').file.url
  end

  def get_file
    send_file Attachment.find(params[:attachment_id]).file.url
  end

  def new_attachment
    @article = Article.find(params[:id])
    @article.attachments.build
    render 'edit'
  end

  def new_author
    @article = Article.find(params[:id])
    @article.authors.build
    render 'edit'
  end

  private

  def find_journal
    @journal = Journal.find(params[:journal_id])
  end
end
