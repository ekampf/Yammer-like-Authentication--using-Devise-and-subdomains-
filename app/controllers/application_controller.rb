class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  
  before_filter :set_mailer_url_options
end
