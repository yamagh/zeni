class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
