# pu.rb
require 'sinatra'
ENV['WEB'] = '1'

configure do
  set :lock, true
end

get '/' do
  erb :index
end

get '/cast/:seed' do
  seed = params['seed'].to_i
  load 'iching.rb'
  markdown(
    Iching.new.cast(
      renderer: HtmlHexagramRenderer,
      seed: seed
    ), layout_engine: :erb
  )
end
