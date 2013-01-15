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
    id = params[:id]
    if id.blank?
      id = current_user.id
    end
    @user = User.find(id)
    @education_map = session[:education_map]
    @position_map = session[:position_map]
    @reviews = Review.find_all_by_user_id(id)
  end

  def credit_check
    render :nothing => true
    credit_score = params[:credit_score]
    user = User.find(current_user.id)
    user.credit_score = credit_score
    user.save
  end
  
  def submit_review
    review = Review.new
    review.review = params[:review][:body]
    review.user_id = params[:id]
    review.reviewer_id = current_user.id
    review.save
    redirect_to :action => :profile, :id => params[:id]
  end

end
