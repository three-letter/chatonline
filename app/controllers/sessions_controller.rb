class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end


  def create
    user = User.where(:github_id => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

  def auth
    auth = request.env["omniauth.auth"]
  end

end
