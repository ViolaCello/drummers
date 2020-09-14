require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "youwillneverguess_thissecretandElvinJonesisthegreatestdrummerever"
  end

  get "/" do
   # binding.pry
  #  erb :welcome
  erb :index
  end

end
