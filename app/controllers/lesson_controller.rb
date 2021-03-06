class LessonController < ApplicationController

    get '/lessons/:id' do
       
        @lesson = Lesson.find_by_id(params[:id].to_i)
       #  goal = Goal.where(:lesson_id => params[:id].to_i) 
      # goal = @lesson.goals # replaced with ActiveRecord association method
       # drummers = []
       # goal.map do |i| # need to iterate through the goals to remove all the duplicate drummers from the particular Lesson exercises
            # a = i.drummer_id
            # b = goal.where(:drummer_id => a).last
            # drummers.push(b)
          #  drummers.push(i)
        #end
      # made above all more DRY by using ActiveRecord association 
        @goal = @lesson.drummers.uniq
          erb :lessons
    end


    get '/lessons/:id/edit' do 
        if logged_in? && current_user.id == params[:id].to_i
            # user = Drummer.find_by_id(current_user.id)
           # binding.pry
           # practice = Goal.where(:drummer_id => user.id) - replaced with ActiveRecord assoication
           # binding.pry
            @practice = current_user.goals.reverse
            erb :"/account/edit_lesson"
        else 
            redirect '/'
        end
    end

    post '/lessons/:id/edit' do 
        if logged_in? && current_user.id == params[:id].to_i
           # user = Drummer.find_by_id(current_user.id)
            @practice = Goal.find_by_id(params[:goal_id].to_i)
           # binding.pry 
            erb :"/account/edit_user_lesson"
        else 
            redirect '/'
        end
    end


    patch '/lessons/:id/edit/:goal' do 
        if logged_in? && current_user.id == params[:id].to_i
            # user = Drummer.find_by_id(current_user.id)
            goal = Goal.find_by_id(params[:goal].to_i)
            if current_user.id == goal.drummer_id
                # binding.pry
                if !check_string(params[:current]) || !check_string(params[:aim])
                    @error = "Data must be whole numbers only"
                    erb :error
                else
                 goal.update(:current => params[:current].to_i, :aim => params[:aim].to_i)
                redirect "/profile/#{current_user.id}"
                end
            else 
                redirect '/'
            end
        else
            redirect '/'
        end
    end

    delete '/lessons/:id/delete/:goal' do 
        if logged_in? && current_user.id == params[:id].to_i
           # user = Drummer.find_by_id(current_user.id)
            goal = Goal.find_by_id(params[:goal].to_i)
            if current_user.id == goal.drummer_id
                goal.delete
                redirect "/profile/#{current_user.id}"
            else
                redirect '/'
            end
        else 
            redirect '/'
        end
    end

end