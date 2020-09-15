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
            # binding.pry
            @practice = my_practice.uniq
            erb :"/account/log_bpm"
        end
        
    end
    
end