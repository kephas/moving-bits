class BaseController < ApplicationController

  def index
    fb_auth = FbGraph::Auth.new("494469310584163", "94bb67109b732429f702b01ad19ec8cc")
    client = fb_auth.client
    client.redirect_uri = "160.228.153.159:3000/facebook/callback"
    redirect_to client.authorization_uri(
    :scope => [:email, :read_stream, :offline_access]
    )
  end

  def fb_callback
    client.authorization_code = params[:code]
    p access_token = client.access_token!(:client_auth_body) # => Rack::OAuth2::AccessToken
    FbGraph::User.me(access_token).fetch # => FbGraph::User
  end
    

end
