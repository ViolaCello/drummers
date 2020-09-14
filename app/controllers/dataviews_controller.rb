class DataviewsController < ApplicationController

get '/community' do
    g = Goal.all 
    last_first = g.reverse
    @community = []
    last_first.map do |i|
        if i.drummer_id 
            @community.push(i)
        end
      #  binding.pry
    end


    erb :community
end


end