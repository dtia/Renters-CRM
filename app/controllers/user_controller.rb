class UserController < ApplicationController
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
end
