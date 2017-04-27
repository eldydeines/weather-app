#Project will get user's location and determine current weather and forecast.
#Location can be zip or city and more.
#Using Barometer gem to pull weather data (Used require).
#Used set_location to create a barometer object and returned it.
#Used get_weather method to call for current weather.
#Used get_forecast method to display forecast.
#Get_forecast had two steps: convert date to string with actual day word
#and created a loop to run on the forcast method, which would populate
#a string with the forecast information for each day (total of five days)


require 'barometer'

#need to set object barometer to user's location
#then send back the object and its methods
def set_location(my_location)

	barometer = Barometer.new(my_location)
	return barometer.measure

end

#display current weather by using current.temperature.f and current.condition
def get_weather(weather)

	puts "For your location, the temperature is: #{weather.current.temperature.f}f"
	puts "Conditions outside: #{weather.current.condition}"

end

#used object Time and its method strftime to get day using forecast.starts_at.day
#then ran loop display each day's forecast.
def get_forecast(weather)
	tomorrow = Time.now.strftime('%d').to_i + 1
	puts "Your forecast:"
	weather.forecast.each do |forecast|

		#Determine which day it is 
		day = forecast.starts_at.day
		if day == tomorrow
			day_name = "Tomorrow"
		else
			day_name = forecast.starts_at.strftime('%A')
		end

		puts "For #{day_name}: #{forecast.icon}, low of #{forecast.low.f}f, and high of #{forecast.high.f}f"
	end
end

#Get user location and set to Weather
puts "Please enter your location:"
my_location = gets
weather = set_location(my_location)

#Call methods
get_weather(weather)
get_forecast(weather)

#end of program