class AuthController < ApplicationController
  
  def index    
    @@config = { 
        :site => 'https://api.linkedin.com',
        :authorize_path => '/uas/oauth/authenticate',
        :request_token_path => '/uas/oauth/requestToken?scope=r_fullprofile+r_network',
        :access_token_path => '/uas/oauth/accessToken'
    }

    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new("0g6bdi39wkev", "4PTap4tYgiYcv5Y6", @@config)
    request_token = client.request_token(:oauth_callback => "http://#{request.host_with_port}/auth/callback")
    
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url
  end

  def callback
    client = LinkedIn::Client.new("0g6bdi39wkev", "4PTap4tYgiYcv5Y6", @@config)
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
    
    
    # need to figure out how to deserialize linkedin api data
    # @profile = client.profile
    #     puts @profile
    #     

     user = client.profile(:fields => %w(positions))
     session[:position_map] = user.positions.all.map{|t| t}.take(3)
         
     user = client.profile(:fields => %w(educations))
     puts user.educations.all.map{|t| t}
     session[:education_map] = user.educations.all.map{|t| t}
     
     redirect_to profile_me_url
  end
  
end
