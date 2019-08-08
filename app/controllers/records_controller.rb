class RecordsController < ApplicationController

  get '/records/new' do
    erb :'/records/new' # saying let's go to the views folder then records then new.erb
  end

  post '/records' do
    record = Record.create(title: params[:title], completed: params[:completed])
    redirect '/'
  end
end
