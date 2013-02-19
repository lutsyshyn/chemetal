class ArticlesController < ApplicationController

  load_and_authorize_resource :journal
  load_and_authorize_resource :article, :through => :journal, shallow: true,
                              except: [:full_pdf, :get_file, :images, :in_preparation]

  respond_to :html

  def new
    #@journal = Journal.find(params[:journal_id])
    #@article = @journal.articles.new

    unless @journal
      @journal = Journal.unpublished.last
      @article = @journal.articles.build
    end

    @article.build_abstract
    5.times { @article.authors.build }
    3.times { @article.attachments.build }
  end

  def edit
    #@article = Article.find(params[:id])
    @article.assignments.build unless @article.reviewers.present?
  end

  def update
    #@article = Article.find(params[:id])
    flash[:success] = 'Article created' if @article.update_attributes(params[:article])
    respond_with(@article)
  end

  def create
    #@journal = Journal.find(params[:journal_id])
    #@article = @journal.articles.new(params[:article])
    @article.user_id = current_user.id
    flash[:success] = 'Article created' if @article.save
    respond_with @article
  end
  
  def show
    #@article = Article.find(params[:id])
    redirect_to article_abstract_path(@article)
  end

  def index
  end

  def destroy
    #@article = Article.find(params[:id])
    #@journal = @article.journal
    @article.destroy
    flash[:success] = 'Article deleted'
    respond_with (@article.journal)
  end

  def received
    if UserMailer.receipt_confirmation(User.find(@article.user_id), @article).deliver
      @article.update_attributes(locked: true)
      flash[:success] = 'Receipt confirmation sent'
      redirect_to edit_article_url(@article)
    end
  end

  def confirm_editor
    if Rails.env == 'production'
      if UserMailer.confirm_editor(@article.editor, @article).deliver
        flash[:success] = 'Editor confirmation sent'
        redirect_to edit_article_url(@article)
      end
    end
  end

  def confirm_reviewer
    @user = User.find(params[:user_id])
    if UserMailer.confirm_reviewer(@user, @article).deliver
      flash[:success] = 'Reviewer confirmation sent'
      redirect_to edit_article_url(@article)
    end
  end

  def in_preparation
    @journals = if current_user && current_user.has_role?(:admin)
      Journal.unpublished
    else
      Journal.unpublished.visible
    end
  end

  def full_pdf
    send_file Attachment.find_by_article_id_and_extension_and_description(params[:id], 'pdf', '').file.url
  end

  def get_file
    send_file Attachment.find(params[:attachment_id]).file.url
  end

  def images
    send_file Attachment.find_by_article_id_and_filename_and_extension(params[:id], params[:filename], params[:format]).file.url,
              :type => 'image/jpeg', :disposition => 'inline'
  end

end
