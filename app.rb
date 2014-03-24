require 'sinatra/base'

class App < Sinatra::Base

  set :items, ['Channa Masala','Saag Paneer']

  get '/' do
    erb :index,:locals => {:items => settings.items}
  end

  get '/item/new' do
    erb :new_item
  end

  post '/item/add' do
    settings.items << params[:new_item]
    redirect '/'
  end

end