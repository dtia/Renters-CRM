class ProfileController < ApplicationController
  before_filter :authenticate_user!

  # api_key = '0g6bdi39wkev'
  # api_secret = '4PTap4tYgiYcv5Y6'
  # configuration = { :site => 'https://api.linkedin.com',
  #                           :authorize_path => '/uas/oauth/authenticate',
  #                           :request_token_path => '/uas/oauth/requestToken',
  #                           :access_token_path => '/uas/oauth/accessToken' }
  # 
  # consumer = OAuth::Consumer.new(api_key, api_secret, configuration)
  # 
  # request_token = consumer.get_request_token
  # # Output request URL to console
  # puts "Please visit this URL: " + request_token.authorize_url + " in your browser and then input the numerical code you are provided here: "
  # 
  # # Set verifier code
  # verifier = $stdin.gets.strip
  
  def me
    @me = User.get_user(current_user.id)
  end
end
