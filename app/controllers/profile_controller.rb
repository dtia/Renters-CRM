class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def me
    @me = User.get_user(current_user.id)
  end
end
