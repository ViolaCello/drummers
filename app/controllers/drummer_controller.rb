class DrummerController < ApplicationController

    get '/profile/:id' do
       # binding.pry
        @profile = Drummer.find_by(id: params[:id])
        erb :profile
    end

end