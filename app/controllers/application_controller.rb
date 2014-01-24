class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(users)
    sign_in_url = url_for(action: 'new',
                          controller: 'sessions',
                          protocol: '/')
    if request.referer == sign_in_url
      super
    else
      users_path
    end
  end
end
