require 'sinatra'
require 'sinatra/reloader' if development?

number = rand(1..100)


get '/' do 
guess = params['guess'].to_i
message = get_message(guess,number)
erb :index, :locals => {:number => number,:message => message}
end 


def get_message(guess,number)
	if guess > number 
		if guess > number + 5 
			"Way too high"
		else 
			"too high"
		end
		 elsif guess < number 
		  if guess < number -5 
		  	"Way too low"
		  else 
		  		"too low"
		  end 
		 elsif guess == number 
		  	"You guessed it: #{number}"			  
	end 
end 