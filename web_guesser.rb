require 'sinatra'
require 'sinatra/reloader'

number = rand(0..100)

get '/' do
   
   guess = params['guess'] 
   message = msg(guess,number)
   color = get_color(guess,number)
   erb :index, :locals => {:number => number, :message => message, :color => color}

end

def get_color(guess, number)
	guess = guess.to_i
	if guess > number + 5 
		"red"
	elsif guess == number 
		"green"	
	end 
end 




def msg(guess,number)
 	if guess != nil 
 		guess = guess.to_i
 		if guess == number 
 			"You Guessed it! #{guess}"
 		elsif guess > number 
 			if guess - number > 5 
 				"#{guess} is way too high"
 			else 
 				"#{guess} is high"
 			end
 			else 
 				if number - guess > 5 
 					"#{guess} is way too low"
 				else
 					"#{guess} is low"
 			end   	
 		end 
 	end

end 