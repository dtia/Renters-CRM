class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def new        
  end
  
  def create
    prop_id = session[:prop_id]
    app_data = Application_Data.create_application_data(params)
    app = Application.create_application(prop_id, Time.now, app_data.id)
    # notify client that app is submitted
    redirect_to profile_me_url
  end
end
