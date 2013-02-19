class AssessmentsController < ApplicationController
  load_resource
  respond_to :html

  def new
  end

  def create
    if @assessment.save
      flash[:success] = 'Assessment created successfully'
      respond_with @assessment
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    flash[:success] = 'Assessment successfully updated.' if @assessment.update_attributes(params[:assessment])
    respond_with @assessment
  end

end
