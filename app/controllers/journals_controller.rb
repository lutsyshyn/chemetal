class JournalsController < ApplicationController
  load_and_authorize_resource

  def new
    #@journal = Journal.new
  end

  def create
    #@journal =  Journal.new(params[:journal])
    if @journal.save
      flash[:success] = 'Journal created successfully'
      redirect_to @journal
    else
      render 'new'
    end
  end

  def show
    #@journal = Journal.find(params[:id])
    if current_user && current_user.has_role?(:admin)
      @articles = @journal.articles.all
    elsif @journal.published
      @articles = @journal.articles.proofed
    else
      @articles = @journal.articles.visible
    end

  end

  def index
    #@journals = Journal.all
  end

  def edit
    #@journal = Journal.find(params[:id])
  end

  def update
    #@journal =  Journal.find(params[:id])
    if @journal.update_attributes(params[:journal])
      flash[:success] = 'Journal edited successfully'
      redirect_to journals_url
    else
      render 'edit'
    end
  end

  def destroy
    Journal.find(params[:id]).destroy
    flash[:success] = 'Journal deleted'
    redirect_to journals_url
  end

  def publish_toggle
    @journal.toggle!(:published)
    respond_to do |format|
      format.html { redirect_to journals_url }
      format.js
    end
  end

  def visible_toggle
    @journal.toggle!(:visible)
    respond_to do |format|
      format.html { redirect_to journals_url }
      format.js
    end
  end

end
