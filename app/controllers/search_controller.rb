class SearchController < ApplicationController
  def index
  end
  
  def search_listings
    city_state = params[:city]
    date = params[:date]
    
    city_state_arr = city_state.split(",").collect{|x| x.strip}
    city = city_state_arr[0]
    state = city_state_arr[1]
    
    @search_results = Property.get_matches(city, state, date)
    
    @search_results.each do |result|
      puts result
    end
  end
end
