class AppController < ApplicationController
  before_filter :authenticate_user!
  
  def new        
  end
  
  def create
    prop_id = session[:prop_id]
    app_data = ApplicationData.create_application_data(params, current_user.id)
    app = Application.create_application(prop_id, Time.now, app_data.id, current_user.id)
    # notify client that app is submitted
    redirect_to profile_user_url(current_user.id)
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
    
    if Application.get_application_for_user(current_user.id, prop_id).empty?
      Application.create_application(prop_id, Time.now, app_data_id, current_user.id)
      flash[:notice] = "Application submitted successfully"
    else
      flash[:notice] = "Application submitted already"
    end
    redirect_to search_listings_url(:city => session[:city])
  end
  
  def edit
    id = params[:id]
    @app = ApplicationData.where("id = ?", id).first
  end
  
  def update
    @app = ApplicationData.find(params[:id])
    if @app.update_attributes(params[:app])
      flash[:notice] = "Application updated"
    else
      flash[:notice] = "Application update failed"
    end
    redirect_to app_url
  end
end
