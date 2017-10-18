class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'layouts/application'
end
