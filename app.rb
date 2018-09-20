require 'sinatra/base'
require 'date'
require './lib/birthday_calcs.rb'

class Birthday < Sinatra::Base
  enable :sessions
  set :session_secret, "my secret session"

  get '/' do
    erb :home
  end

  get '/birthday' do
    @birthday = session[:birthday]
    erb :birthday
  end

  post '/birthday' do
    session[:birthday] = BirthdayCalcs.new(params[:fname],params[:bdate])
    if session[:birthday].birthday_today?
      redirect '/birthday'
    else
      redirect '/not-birthday'
    end
  end

  get '/not-birthday' do
    @birthday = session[:birthday]
    erb :not_birthday
  end
end
