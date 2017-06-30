require 'sinatra'
require 'sinatra/reloader'

number = rand(0..100)
@@remaining = 6

get '/' do 
   guess = params['guess'] 
   message = msg(guess,number)
   remaining = remainder
   color = get_color(guess,number)
   erb :index, :locals => {:number => number, 
   	:message => message, :color => color, 
   	:remaining => remaining}

end

def remainder
	@@remaining = @@remaining - 1 
	"you have #{@@remaining} guesses remaining!"
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