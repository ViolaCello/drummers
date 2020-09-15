require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "11 18 92 89 96 96 c9 d4 95 11 0f ef e0 1a 70 97"
  end

  get "/" do
  # binding.pry
  #  erb :welcome
    @users = Drummer.all 
    @less = Lesson.all 
    @g = Goal.all 
  erb :index
  end

helpers do
  
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = Drummer.find_by_id(session[:user_id]) if logged_in?
  end

end



end