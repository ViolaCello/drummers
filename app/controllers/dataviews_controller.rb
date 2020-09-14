class DataviewsController < ApplicationController

get '/community' do
    g = Goal.all 
    last_first = g.reverse
    @community = []
    last_first.map do |i|
        if i.drummer_id 
            @community.push(i)
        end
    end
    erb :community
end

get '/leaders' do
    @leaders = []

    lesson = Lesson.all
    lesson.map do |i|
        leader = (i.goals.maximum(:current))
        @leaders.push(i.goals.where(:current => leader))
    end
# binding.pry 
    erb :leaders
end

end