class UserController < ApplicationController
  def new
    
  end
  
  def create
    fbid = params[:uid]
    role = params[:role]
    firstname = params[:firstname]
    lastname = params[:lastname]
    email = params[:email]
    phone = params[:phone]
    ssn = params[:ssn]
    
    session[:fbid] = fbid
    
    User.create(role, firstname, lastname, email, phone, ssn, fbid)
    redirect_to "/search_listings"
  end
end
