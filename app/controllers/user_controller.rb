class UserController < ApplicationController
  before_filter :authenticate_user!
  
  def new    
  end
  
  def create
    role = params[:role]
    firstname = params[:firstname]
    lastname = params[:lastname]
    email = params[:email]
    phone = params[:phone]
    ssn = params[:ssn]
    
    User.create(role, firstname, lastname, email, phone, ssn)
    redirect_to "/search_listings"
  end
  
  def profile
    @me = User.get_user(params[:user_id])
    @education_map = session[:education_map]
    @position_map = session[:position_map]
  end
end
