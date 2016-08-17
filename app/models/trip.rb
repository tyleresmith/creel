class Trip < ActiveRecord::Base
    belongs_to :user
    has_many :catches
    has_many :fishes, through: :catches
end
