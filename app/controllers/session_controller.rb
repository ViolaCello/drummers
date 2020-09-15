class DrummerController < ApplicationController

    get '/join' do
        
    end

    post '/join' do
        
    end

    get '/login' do
        
    end

    post '/login' do
        
    end

    get '/logout' do
        session.clear
        redirect '/'
      end

end