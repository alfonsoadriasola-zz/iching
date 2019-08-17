# pu.rb
require 'sinatra'
ENV['WEB'] = '1'

configure do
  set :lock , true
end

get '/' do
  erb :index
end

get '/cast/' do
  load 'iching.rb'
  markdown Iching.new.cast(renderer: StringHexagramRenderer),
           layout_engine: :erb
end
