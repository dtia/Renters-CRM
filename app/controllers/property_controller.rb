class PropertyController < ApplicationController
  def index
    fbid = session[:fbid]
    
    # account for null fb id
    if fbid.nil?
      fbid = params[:fbid]
      puts 'this is the fbid ' + fbid
    end
    
    @properties = Property.get_properties(fbid)
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
    fb_id = params[:uid]
    
    Property.create(beds, baths, street, unit, city, state, zip, avail_date, price, deposit, has_parking, fb_id)
    redirect_to :action => "index"
  end
end
