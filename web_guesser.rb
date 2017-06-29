require 'sinatra'
require 'sinatra/reloader'

generate = rand(0..100)

get '/' do 
   "the secret number is #{generate}"
end 