class UserReservationsController < ApplicationController

require 'pry'
	def create
		bus1 = Bus.find(1)
		bus2 = Bus.find(2)
		bus3 = Bus.find(3)
		bus4 = Bus.find(4)
		busArray = [bus1, bus2, bus3, bus4]

		time = params[:time].to_i
		name = params[:name]
		start = params[:start]
		destination = params[:destination]
		busCounter = 0


		busArray.each { |bus|
			busCounter +=1
			if bus.users.length < 6 
				newUser = User.create(name: name)
				bus.userReservations.create(time: time, startPlace: start, destination: destination, user_id: newUser.id)
				render json: bus, status: 201
				break
			else
				startdestinationCounter = 0
				timeCounter = 0
				bus.userReservations.each do |reservation|
					# start and end places matter
					if start == reservation.startPlace && destination == reservation.destination
						
						startdestinationCounter +=1
					end
					if time == reservation.time || (reservation.time + 4) > time && (reservation.time + 4) != time
					# trips take 4 hours in total
						timeCounter +=1
					end
					
					if startdestinationCounter >= 6 || timeCounter >=6
						break
					end
				end

				if timeCounter < 6 || startdestinationCounter < 6
					# binding.pry
					newUser = User.create(name: name)
					bus.userReservations.create(time: time, startPlace: start, destination: destination, user_id: newUser.id)
					render json: bus, status: 201
					break
				elsif timeCounter > 6 || startdestinationCounter >6 || busCounter >=4
					render json: { error: "Couldn't create bus reservation, please choose another time/start or destination"  }, status: 400
					break
				end	
			end
		}
	end
end
