class DrummerController < ApplicationController

    get '/profile/:id' do
       # binding.pry
        @profile = Drummer.find_by(id: params[:id])
        erb :profile
    end

    get '/profile/:id/edit' do
        if logged_in?
            @profile = Drummer.find_by(id: params[:id])
            if @profile && @profile == current_user
                erb :"/account/edit_profile"
             else
                redirect '/'
            end
        else
            redirect '/login'
        end 
    end
    
    patch '/profile/:id/edit' do 
        if logged_in?
            @profile = Drummer.find_by_id(params[:id])
              if @profile && @profile == current_user
                if @profile.update(hometown: params[:hometown], favorite_drummer: params[:favorite_drummer])
                  redirect "/profile/#{@profile.id}"
                else
                  redirect "/profile/#{@profile.id}/edit"
                end
              else
                redirect '/profile'
              end
            end
            redirect '/login'
          end
    

end