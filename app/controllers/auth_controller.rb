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
    
    insert_linkedin_fields(client)
    redirect_to profile_user_url(current_user.id)
  end
  
  private
    def insert_linkedin_fields(client)
      user = client.profile(:fields => %w(positions))
      positions = user.positions.all.map{|t| t}.take(3)
      Position.insert_positions(positions, current_user.id)

      user = client.profile(:fields => %w(educations))
      educations = user.educations.all.map{|t| t}
      puts educations
      Education.insert_educations(educations, current_user.id)
    end
end
