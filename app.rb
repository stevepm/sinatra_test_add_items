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

  get '/items/:id' do
    erb :single_item, :locals => { :item => settings.items[(params[:id].to_i)-1], :id => params[:id] }
  end

  post '/item/edit' do
    settings.items[(params[:id].to_i)-1] = params[:updated_name]
    redirect '/'
  end

end