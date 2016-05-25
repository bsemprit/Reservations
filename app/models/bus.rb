class Bus < ActiveRecord::Base
  has_many :userReservations
  has_many :users, through: :userReservations
end
