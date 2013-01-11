class PropertyController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @properties = Property.get_properties(current_user.id)
  end
  
  def new
  end
  
  def create
    beds = params[:beds]
    baths = params[:baths]
    street = params[:street]
    unit = params[:unit]
    city = params[:city]
    state = params[:state]
    zip = params[:zip]
    avail_date = params[:avail_date]
    price = params[:price]
    deposit = params[:deposit]
    has_parking = params[:has_parking]
    
    Property.create(beds, baths, street, unit, city, state, zip, avail_date, price, deposit, has_parking, current_user.id)
    redirect_to :action => "index"
  end
  
  def apply
    prop_id = params[:prop_id]
    
    app_data = ApplicationData.where("userid = ?", current_user.id).first
    
    # if application data does not exist for user yet, redirect to application page
    if app_data.nil?
      session[:prop_id] = prop_id
      redirect_to new_application_url
    else
      # submit application data
      Application.create_application(prop_id, Time.now, app_data.id, current_user.id)
      # notify client app has been created
    end
  end
end
