class Fish < ActiveRecord::Base
    has_many :catches
    has_many :trips, through: :catches
    has_many :users, through: :trips
end
