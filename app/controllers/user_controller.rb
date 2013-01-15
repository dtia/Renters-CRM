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
    redirect_to search_listings_url
  end
  
  def profile
    @me = User.get_user(current_user.id)
    @education_map = session[:education_map]
    @position_map = session[:position_map]
  end

  def credit_check
    render :nothing => true
    credit_score = params[:credit_score]
    user = User.find(current_user.id)
    user.credit_score = credit_score
    user.save
  end

end
