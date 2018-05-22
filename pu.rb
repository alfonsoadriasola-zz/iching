# pu.rb
require 'sinatra'

get '/' do
  erb :index
end

get '/cast/' do
  load 'iching.rb'
  markdown Iching.new.cast(renderer: StringHexagramRenderer)
end
