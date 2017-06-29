require 'sinatra'
require 'sinatra/reloader'

generate = rand(0..100)

get '/' do 
   erb :index
end 