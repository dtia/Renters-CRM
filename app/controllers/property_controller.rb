class PropertyController < ApplicationController
  def index
    user_id = 13 #hardcoded, need to change once user id is secured
    @properties = Property.get_properties(user_id)
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
    user_id = 13 # this needs to be updated with user id. currently hardcoded with existing user id
    
    Property.create(beds, baths, street, unit, city, state, zip, avail_date, price, deposit, has_parking, user_id)
    redirect_to :action => "index"
  end
end
