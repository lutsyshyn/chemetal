class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, except: [:index, :show, :get_file, :images, :full_pdf]
end
