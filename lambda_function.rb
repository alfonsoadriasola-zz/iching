require 'json'
require_relative "./iching.rb"

def lambda_handler(event:, context:)
    response = Iching.new.cast(renderer: JsonHexagramRenderer)
    { statusCode: 200}.merge response
end

