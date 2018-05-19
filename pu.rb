# pu.rb
require 'sinatra'

get '/' do
  'you got to start somewhere.'
end

get '/iching/' do
  %(
    <h2>Greetings; it's \n #{Time.now}</h2>
    <strong> Think and <a href="/cast/">Ask</a> </strong>
  )
end

get '/cast/' do
  load 'iching.rb'
  markdown Iching.new.cast(renderer: StringHexagramRenderer)
end
