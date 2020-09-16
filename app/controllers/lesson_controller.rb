class LessonController < ApplicationController

    get '/lessons/:id' do
       
        @lesson = Lesson.find_by_id(params[:id].to_i)
        goal = Goal.where(:lesson_id => params[:id].to_i)
        drummers = []
        goal.map do |i| # need to iterate through the goals to remove all the duplicate drummers from the particular Lesson exercises
            a = i.drummer_id
            b = goal.where(:drummer_id => a).last
            drummers.push(b)
        end
        @goal = drummers.uniq
          erb :lessons
    end


    get '/lessons/:id/edit' do 
        if logged_in? && current_user.id == params[:id].to_i
            user = Drummer.find_by_id(current_user.id)
           # binding.pry
            @practice = Goal.where(:drummer_id => user.id)
            erb :"/account/edit_lesson"
        else 
            redirect '/'
        end
    end

    post '/lessons/:id/edit' do 
        if logged_in? && current_user.id == params[:id].to_i
            user = Drummer.find_by_id(current_user.id)
            @practice = Goal.find_by(:lesson_id => params[:lesson_id].to_i)
            erb :"/account/edit_user_lesson"
        else 
            redirect '/'
        end
    end


    patch '/lessons/:id/edit' do 
        if logged_in? && current_user.id == params[:id].to_i
            user = Drummer.find_by_id(current_user.id)
        end
    end

    patch '/lessons/:id/delete/:goal' do 
        if logged_in? && current_user.id == params[:id].to_i
            user = Drummer.find_by_id(current_user.id)
            goal = Goal.find_by_id(params[:goal].to_i)
            if user.id == goal.drummer_id
                goal.delete
                redirect '/profile/#{user.id}'
            else
                redirect '/'
            end
        else 
            redirect '/'
        end
    end

end