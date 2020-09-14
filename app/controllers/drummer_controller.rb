class DrummerController < ApplicationController

    get '/profile/:id' do
        @profile = Drummer.find_by(id: params[:id])
        erb :profile
    end

end