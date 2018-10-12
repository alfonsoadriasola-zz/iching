# pu.rb
require 'sinatra'
require 'openssl'
require 'webrick'
require 'webrick/https'

ENV['WEB'] = '1'
get '/' do
  erb :index
end

get '/cast/' do
  load 'iching.rb'
  markdown Iching.new.cast(renderer: StringHexagramRenderer),
           layout_engine: :erb
end

webrick_options = {
  :Port => 8443,
  :Logger => WEBrick::Log::new($stdout, WEBrick::Log::DEBUG),
  :SSLEnable => true,
  :SSLCertificate => OpenSSL::X509::Certificate.new(File.open("./cert.crt").read),
  :SSLPrivateKey => OpenSSL::PKey::RSA.new(File.open("./pkey.pem").read),
  :SSLCertName => [['CN', 'localhost', OpenSSL::ASN1::PRINTABLESTRING]]
}