class User < ActiveRecord::Base
	has_many :userReservations
	has_many :buses, through: :userReservations
end
