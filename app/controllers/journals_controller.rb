class JournalsController < ApplicationController

  def new
    @journal = Journal.new
  end

  def create
    @journal =  Journal.new(params[:journal])
    if @journal.save
      flash[:success] = 'Journal created successfully'
      redirect_to @journal
    else
      render 'new'
    end
  end

  def show
    @journal = Journal.find(params[:id])
    @articles = @journal.articles.all
  end

  def index
    @journals = Journal.all
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal =  Journal.find(params[:id])
    if @journal.update_attributes(params[:journal])
      flash[:success] = 'Journal edited successfully'
      redirect_to @journal
    else
      render 'edit'
    end
  end

  def destroy
    Journal.find(params[:id]).destroy
    flash[:success] = 'Journal deleted'
    redirect_to journals_url
  end

end
