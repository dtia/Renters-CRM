class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    profile_user_url(current_user.id)
  end
end
