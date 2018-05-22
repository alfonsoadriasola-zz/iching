# pu.rb
require 'sinatra'
ENV['WEB'] = '1'
get '/' do
  erb :index
end

get '/cast/' do
  load 'iching.rb'
  markdown Iching.new.cast(renderer: StringHexagramRenderer)
end
