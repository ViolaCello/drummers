class SessionController < ApplicationController

    get '/join' do
        
        if logged_in?
            redirect '/'
        else
         erb :"/account/join"
       end
    end

    post '/join' do
        @user = Drummer.new(username: params["username"], password: params["password"], hometown: params["hometown"], favorite_drummer: params["favorite_drummer"])
        if @user.save
            session[:user_id] = @user.id
           # binding.pry
            redirect "/profile/#{@user.id}"
        else
           redirect '/join'
        end
    end

    get '/login' do
        if logged_in?
           redirect "/profile/#{@user.id}"
        end
        erb :"/account/login"
    end

    post '/login' do
        user = Drummer.find_by(username: params["username"])
        if !!user && !!user.authenticate(params["password"])
        session[:user_id] = user.id
        redirect "/profile/#{user.id}"
    end
        redirect '/login'
end

    get '/logout' do
        session.clear
        redirect '/'
      end

end