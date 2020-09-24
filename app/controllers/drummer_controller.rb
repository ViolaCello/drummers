class DrummerController < ApplicationController

    get '/profile/:id' do
       @profile = Drummer.find_by(id: params[:id])
       if @profile = Drummer.find_by(id: params[:id])
       # goals = Goal.where(:drummer_id => @profile.id) # remove since ActiveRecord association methods are more DRY
        @goals = @profile.goals.reverse #so the practice log displays the latest entry closest to the top of the list
        erb :profile
       else
        redirect '/'
       end
    end

    get '/profile/:id/edit' do
        if logged_in?
            @profile = Drummer.find_by(id: params[:id])
           # if @profile && @profile.id == current_user.id
           user_ok?(@profile) # replaced redundant code with new helper method 
                erb :"/account/edit_profile"
            #  else
            #     redirect '/'
            # end
        else
            redirect '/login'
        end 
    end
    
    patch '/profile/:id/edit' do 
        if logged_in?
            @profile = Drummer.find_by_id(params[:id])
            #   if @profile && @profile.id == current_user.id
            user_ok?(@profile)
                if @profile.update(:hometown => params[:hometown], :favorite_drummer => params[:favorite_drummer])
                  redirect "/profile/#{@profile.id}"
                else
                  redirect "/profile/#{@profile.id}/edit"
                end
              
            end
            redirect '/login'
          end
    
    get '/profile/:id/delete' do
        # binding.pry
        if logged_in? && current_user.id == params[:id].to_i
            @profile = Drummer.find_by_id(params[:id])
            erb :"/account/delete"
        else
            redirect '/'
        end
    end

    delete '/profile/:id/delete' do
        if logged_in? && current_user.id == params[:id].to_i
            @profile = Drummer.find_by_id(params[:id])
           # if @profile && @profile.id == current_user.id
           user_ok?(@profile) # replaced redundant code with new helper method 
                remove = Goal.purge_by_id(@profile.id)
                @profile.delete
           # end
            redirect '/logout'
        end
        redirect '/logout'
    end

end