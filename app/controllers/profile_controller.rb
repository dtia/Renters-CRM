class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def me
    @me = User.get_user(current_user.id)
    @education_map = session[:education_map]
  end
end
