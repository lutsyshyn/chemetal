class AbstractsController < ApplicationController

  before_filter :set_variables

  def show
  end

  def set_variables
    @abstract = Abstract.find(params[:id])
  end
end
