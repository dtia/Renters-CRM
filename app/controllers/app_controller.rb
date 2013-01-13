class AppController < ApplicationController
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
    @app = ApplicationData.where("user_id = ?", current_user.id)
    if @app.blank?
      redirect_to new_app_url
    else      
      @app = @app.first
    end
  end
  
  def submit
    prop_id = session[:prop_id]
    app_data_id = params[:app_id]
    
    if Application.get_application(current_user.id, prop_id).empty?
      Application.create_application(prop_id, Time.now, app_data_id, current_user.id)
      flash[:notice] = "Application submitted successfully"
    else
      flash[:notice] = "Application submitted already"
    end
    redirect_to search_listings_url(:city => session[:city])
  end
end
