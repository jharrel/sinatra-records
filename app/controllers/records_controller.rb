class RecordsController < ApplicationController
  use Rack::Flash

  get '/records' do
    redirect_if_not_signed_in
    @records = current_user.records
    erb :'records/index'
  end

  get '/records/new' do
    redirect_if_not_signed_in
    erb :'records/new'
  end

  get '/records/:id' do
    redirect_if_not_signed_in
    set_record
    erb :'records/show'
  end

  post '/records' do
    redirect_if_not_signed_in
    @record = current_user.records.build(record_params)
    if @record.save
      redirect '/records'
    else
      @errors = @record.errors.full_messages
      erb :'records/new'
    end
  end

  get '/records/:id/edit' do
    redirect_if_not_signed_in
    set_record
    if @record.user == current_user
      erb :'records/edit'
    else
      flash[:notice] = "You are not authorized to do that, young jedi."
      redirect '/'
    end
  end

  patch '/records/:id' do
    redirect_if_not_signed_in
    set_record
    @record = Record.find_by_id(params[:id])
    if @record.update(record_params)
      redirect "/records/#{@record.id}"
    else
      @errors = @record.errors.full_messages
      erb :'records/edit'
    end
  end

  delete "/record/:id" do
    redirect_if_not_signed_in
    set_record
    @record.destroy
    redirect "/records"
  end

  private
  def set_record
    @record = Record.find_by_id(params[:id])
  end

  def record_params
    { title: params[:record][:title], complete: params[:record][:complete] }
  end
end

  #get '/records/new' do
  #  erb :'/records/new' # saying let's go to the views folder then records then new.erb
  #end

  #post '/records' do
  #  record = Record.create(title: params[:title], completed: params[:completed])
  #  redirect '/'
  #end
