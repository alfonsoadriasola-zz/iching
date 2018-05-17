#pu.rb
require 'sinatra'

get '/' do
  'you got to start somewhere.'
end

get '/iching/' do 
 "Greetings; it's #{Time.now}"
end

get '/cast/' do
 load 'iching.rb'
 Iching.new.cast(renderer: StringHexagramRenderer)
end
