require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "11 18 92 89 96 96 c9 d4 95 11 0f ef e0 1a 70 97"
  end

  get "/" do
    purge = Goal.purge_unidentified_data
    @users = Drummer.all 
  erb :index
  end

helpers do
  
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = Drummer.find_by_id(session[:user_id]) if logged_in?
  end

  def account_active?(id)
     !!Drummer.find_by_id(id)
  end
    
  def check_string(string)
    result = false
    if string.to_i.to_s.eql? string
      result =  true
    end
    result
  end

end

def user_ok?(profile)
       if profile && profile.id != current_user.id
        redirect '/'
      end
    end


end