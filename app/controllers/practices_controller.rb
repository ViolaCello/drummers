class PracticesController < ApplicationController


    get '/practice/:id' do
      #  binding.pry
        if !logged_in? || current_user.id != params[:id].to_i
            redirect '/'
        else 
            my_practice = []
            practice = Goal.where(:drummer_id => current_user.id)
            practice.map do |i|
                a = i.lesson_id
                b = practice.where(:lesson_id => a).last
                my_practice.push(b)
            end
            @all_lessons = Lesson.all
            @practice = my_practice.uniq
            erb :"/account/log_bpm"
        end
    end
    
    post '/practice/:id' do
        if !logged_in? || current_user.id != params[:id].to_i
            redirect '/'
        else 
            @update = Lesson.find_by(:exercise => params[:exercise])
            @goals = @update.goals.where(:drummer_id => current_user.id).last
            # binding.pry
            erb :"/account/edit_bpm"
        end
    end

    post '/practice/:id/:exercise' do
        if !logged_in? || current_user.id != params[:id].to_i
            redirect '/'
        else
            drummer = Drummer.find_by_id(params[:id])
            lesson = Lesson.find_by(:exercise => params[:exercise])
           # binding.pry
            if practice = Goal.create(current: params[:current].to_i, aim: params[:aim].to_i)
                drummer.goals << practice
                lesson.goals << practice
            else  
                 redirect "/practice/#{current_user.id}"
            end

       redirect "/profile/#{current_user.id}"
end
end
end