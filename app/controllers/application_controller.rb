class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  def new        
  end
  
  def create
    prop_id = session[:prop_id]
    app_data = ApplicationData.create_application_data(params, current_user.id)
    app = Application.create_application(prop_id, Time.now, app_data.id, current_user.id)
    # notify client that app is submitted
    redirect_to profile_me_url
  end
  
  def show
  end
end
