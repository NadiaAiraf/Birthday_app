require 'sinatra'

enable :sessions
set :session_secret, "my secret session"

get '/' do
  p params
  erb(:home)
end

post '/birthday' do
  p params
  session[:name] = params[:fname]
  session[:date] = params[:bdate]
  redirect '/birthday'
end

get '/birthday' do
  p session
  erb(:birthday)
end
