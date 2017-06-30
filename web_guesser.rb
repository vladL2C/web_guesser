require 'sinatra'
require 'sinatra/reloader'

number = rand(0..100)

get '/' do
   
   guess = params['guess'] 
   message = msg(guess,number)
   erb :index, :locals => {:number => number, :message => message}

end 



def msg(guess,number)
 	if guess != nil 
 		guess = guess.to_i
 		if guess == number 
 			"The number is: #{guess}"
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