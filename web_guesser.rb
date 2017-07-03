require 'sinatra'
require 'sinatra/reloader' if development?

number = rand(1..100)

get '/' do
guess = params['guess'].to_i
cheater = params['cheat']
color = colorize(guess,number)
check = check_guess(guess,number,cheater)
erb :index, :locals => {:number => number,:check => check,
:color => color}
end

def colorize(guess,number)
	if guess > number + 5 || guess < number - 5
	   "red"
	elsif guess > number || guess < number
		"yellow"
	else 
	"green"	   	
	end  
end 

def check_guess(guess,number,cheater)
	if cheater == "true"
		message = "The number is #{number} you cheater"
	else 
	get_message(guess,number)	
	end 

end 

def get_message(guess,number)

	if guess > number 
		if guess > number + 5 
			"Way too high"
		else 
			"Too high"
		end
		 elsif guess < number 
		  if guess < number -5 
		  	"Way too low"
		  else 
		  		"Too low"
		  end 
		 elsif guess == number 
		 	"you guessed it: #{number}"	
		  			  
	end 
 
end 



