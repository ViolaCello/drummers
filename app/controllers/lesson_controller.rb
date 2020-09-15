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

end