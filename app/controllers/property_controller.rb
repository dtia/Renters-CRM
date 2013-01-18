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
    session[:prop_id] = prop_id
    app_data = ApplicationData.where("user_id = ?", current_user.id).first

    # if application data does not exist for user yet, redirect to application page
    if app_data.nil?
      redirect_to new_app_url
    else
      redirect_to app_url(current_user.id)
    end
  end
  
  def applications
    prop_id = params[:id]
    
    @property = Property.find(prop_id)
    @applicants = User.get_users_for_apps(prop_id)
  end
end
