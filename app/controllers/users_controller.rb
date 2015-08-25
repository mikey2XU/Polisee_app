class UsersController < ApplicationController

	def index
  		@lat_lng = cookies[:lat_lng].split("|")
  		@lat = @lat_lng[0].to_f
  		@lng = @lat_lng[1].to_f 	

  		client = Congress::Client.new("9895908e7d2d4b6592582f91478ad662")
  		@your_reps = client.legislators_locate(@lat, @lng).results
  		@name_array = []
  		@your_reps.each do |obj|
  			@name_array << obj.first_name
  		end
	end
end
