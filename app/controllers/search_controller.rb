class SearchController < ApplicationController
  def index
  end
  
  def search_listings
    city_state = params[:city]
    date = params[:date]    
    session[:city] = city_state
    
    @property = Property.new
    
    if !city_state.nil?
      city_state_arr = city_state.split(",").collect{|x| x.strip}
      city = city_state_arr[0]
      state = city_state_arr[1]
    else
      city = 'San Francisco'
      state = 'CA'
    end    
    @search_results = Property.get_matches(city, state, date)
  end
end
