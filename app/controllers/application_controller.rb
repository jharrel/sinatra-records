require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do #when we do a redirect it's doing a get request back to this location
    @records = Record.all 
    erb :welcome
  end

end
